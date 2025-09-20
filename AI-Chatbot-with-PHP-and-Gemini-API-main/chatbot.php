<?php
// chatbot.php — Gemini AI API integration for Library Chatbot

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

// Gemini API key (store in .env in production)
$api_key = "AIzaSyCZOrtazGRxU1nuSh6mqTxEgPTW6v0Y9NE";
$url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$api_key";


// Read user input
$input = json_decode(file_get_contents("php://input"), true);
if (!$input || !isset($input['message']) || trim($input['message']) === "") {
    echo json_encode(['error' => 'Invalid input']);
    exit;
}
$user_message = trim($input['message']);

// Connect to MySQL (read-only)
$con = mysqli_connect("localhost", "root", "", "librarymanagementdb");
if (mysqli_connect_errno()) {
    echo json_encode(['error' => 'Database connection failed']);
    exit;
}

// Helper: get member id by name (case-insensitive)
function getMemberIDByName($con, $name) {
    $name = mysqli_real_escape_string($con, $name);
    $sql = "SELECT id FROM users WHERE LOWER(Name) = LOWER('$name') LIMIT 1";
    $res = mysqli_query($con, $sql);
    if ($row = mysqli_fetch_assoc($res)) return $row['id'];
    return false;
}

// Helper: get books issued to member
function getIssuedBooks($con, $memberID) {
    // $memberID is users.id
    $sql = "SELECT b.Book_Title FROM book_issue bi JOIN books b ON bi.Book_Title = b.id WHERE bi.Member='$memberID'";
    $res = mysqli_query($con, $sql);
    $books = [];
    while ($row = mysqli_fetch_assoc($res)) $books[] = $row['Book_Title'];
    return $books;
}

// Helper: get books returned by member
function getReturnedBooks($con, $memberID) {
    $sql = "SELECT b.Book_Title FROM return_book rb JOIN books b ON rb.Book_Title = b.id WHERE rb.Member='$memberID'";
    $res = mysqli_query($con, $sql);
    $books = [];
    while ($row = mysqli_fetch_assoc($res)) $books[] = $row['Book_Title'];
    return $books;
}

// Helper: get not returned books by member
function getNotReturnedBooks($con, $memberID) {
    $sql = "SELECT b.Book_Title FROM book_issue bi JOIN books b ON bi.Book_Title = b.id WHERE bi.Member='$memberID' AND bi.Book_Title NOT IN (SELECT Book_Title FROM return_book WHERE Member='$memberID')";
    $res = mysqli_query($con, $sql);
    $books = [];
    while ($row = mysqli_fetch_assoc($res)) $books[] = $row['Book_Title'];
    return $books;
}

// Try to answer from DB if possible (simple: MemberID or BookID/ISBN only)
$db_answer = null;

// If message contains a BookID or ISBN (e.g. "BookID: 123" or "ISBN: ..." or ISBN with dashes)
if (preg_match('/(bookid|isbn)\s*:?[\s]*([\w-]+)/i', $user_message, $m)) {
    if (stripos($m[1], 'isbn') !== false) {
        $col = 'ISBN_NO';
    } else {
        $col = 'id';
    }
    $val = mysqli_real_escape_string($con, $m[2]);
    $sql = "SELECT * FROM books WHERE $col='$val' LIMIT 1";
    $res = mysqli_query($con, $sql);
    if ($res === false) {
        $db_answer = 'SQL error: ' . mysqli_error($con);
    } elseif ($row = mysqli_fetch_assoc($res)) {
        $db_answer = 'Book: ' . $row['Book_Title'] . ' (Author: ' . $row['Author_Name'] . ', ISBN: ' . $row['ISBN_NO'] . ')';
    } else {
        $db_answer = 'Book not found.';
    }
}

// If message contains a MemberID (e.g. "MemberID: 123" or just "123"), show books issued/returned
if (!$db_answer && (preg_match('/memberid\s*:?[\s]*(\d+)/i', $user_message, $m) || preg_match('/\b(\d{2,})\b/', $user_message, $m))) {
    $memberID = $m[1];
    // Check if member exists
    $q = mysqli_real_escape_string($con, $memberID);
    $sql = "SELECT Name FROM users WHERE id='$q' LIMIT 1";
    $res = mysqli_query($con, $sql);
    if ($res === false) {
        $db_answer = 'SQL error: ' . mysqli_error($con);
    } elseif ($row = mysqli_fetch_assoc($res)) {
        $member_name = $row['Name'];
        $books = getIssuedBooks($con, $memberID);
        $returned = getReturnedBooks($con, $memberID);
        $not_returned = getNotReturnedBooks($con, $memberID);
        $db_answer = "👤 Member: $member_name (ID: $memberID)\n";
        $db_answer .= "Total books issued: ".count($books)."\n";
        $db_answer .= "Books returned: ".count($returned)."\n";
        $db_answer .= "Books not returned: ".count($not_returned)."\n";
        if (count($books) == 0) {
            $db_answer .= "This member hasn't issued any books yet. 📚";
        } elseif (count($not_returned) > 0) {
            $db_answer .= "Looks like there are some books still to be returned! 😊";
        } else {
            $db_answer .= "All issued books have been returned. Great job! 👍";
        }
    } else {
        $db_answer = 'MemberID not found.';
    }
}

if ($db_answer) {
    echo json_encode(['response' => $db_answer]);
    mysqli_close($con);
    exit;
}

// Check for library-related content (make less strict)
$library_keywords = ['book', 'library', 'author', 'isbn', 'magazine', 'journal', 'member', 'issue', 'return', 'borrow', 'shelf', 'catalog', 'reading'];
$is_library_question = false;

foreach ($library_keywords as $keyword) {
    if (stripos($user_message, $keyword) !== false) {
        $is_library_question = true;
        break;
    }
}

// Only block if message is clearly not related (very short or generic)
if (!$is_library_question && strlen($user_message) < 8) {
    echo json_encode(['response' => "⚠️ Please ask something related to the library (e.g., books, authors, members, returns)."]);
    exit;
}

// Gemini prompt: force short reply (1–2 lines max)
$prompt = "You are a helpful library assistant chatbot. Answer the following user query in 1–2 lines:\n" . $user_message;

// Prepare Gemini API payload
$data = [
    "contents" => [
        [
            "parts" => [
                ["text" => $prompt]
            ]
        ]
    ]
];

// Call Gemini API
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
curl_setopt($ch, CURLOPT_HTTPHEADER, ["Content-Type: application/json"]);
$response = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

if ($http_code !== 200) {
    echo json_encode(['error' => 'Google Gemini API error']);
    exit;
}

$response_data = json_decode($response, true);
$ai_reply = $response_data['candidates'][0]['content']['parts'][0]['text'] ?? null;

if (!$ai_reply) {
    echo json_encode(['error' => 'Unexpected API response format']);
    exit;
}

// Clean response: remove HTML tags, trim whitespace, allow markdown
$clean_reply = trim(strip_tags($ai_reply));

echo json_encode(['response' => $clean_reply]);
exit;
