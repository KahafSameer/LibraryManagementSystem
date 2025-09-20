<?php
// Enable error logging
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Set max file size for HTML form (in bytes)
$maxFileSize = 5 * 1024 * 1024; // 5MB
define('MAX_FILE_SIZE', $maxFileSize);

// Logging checkpoint
file_put_contents('log.txt', "✅ Entered upload.php at " . date('Y-m-d H:i:s') . "\n", FILE_APPEND);

// Configuration
$uploadDir = __DIR__ . '/uploads/';

// Create uploads folder if missing
if (!file_exists($uploadDir)) {
    mkdir($uploadDir, 0755, true);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if (!isset($_FILES['pdf']) || $_FILES['pdf']['error'] !== UPLOAD_ERR_OK) {
        $errMsg = 'No file uploaded or upload error.';
        if (isset($_FILES['pdf']['error'])) {
            switch ($_FILES['pdf']['error']) {
                case UPLOAD_ERR_INI_SIZE:
                case UPLOAD_ERR_FORM_SIZE:
                    $errMsg = 'File too large. Max 5MB allowed.';
                    break;
                case UPLOAD_ERR_PARTIAL:
                    $errMsg = 'File upload was incomplete.';
                    break;
                case UPLOAD_ERR_NO_FILE:
                    $errMsg = 'No file uploaded.';
                    break;
                default:
                    $errMsg = 'Unknown upload error.';
            }
        }
        file_put_contents('log.txt', "❌ $errMsg\n", FILE_APPEND);
        header("Location: index.php?error=" . urlencode($errMsg));
        exit;
    }



    $file = $_FILES['pdf'];
    // Stricter file name sanitization
    $originalName = basename($file['name']);
    $safeBase = preg_replace('/[^a-zA-Z0-9_\-]/', '_', pathinfo($originalName, PATHINFO_FILENAME));
    $fileExt = strtolower(pathinfo($originalName, PATHINFO_EXTENSION));
    $mimeType = mime_content_type($file['tmp_name']);


    // Ensure only .pdf extension is accepted
    if ($fileExt !== 'pdf') {
        file_put_contents('log.txt', "❌ Invalid file extension: $fileExt\n", FILE_APPEND);
        header("Location: index.php?error=" . urlencode('Only PDF files are allowed'));
        exit;
    }


    // Validate file type (MIME check is secondary)
    if ($mimeType !== 'application/pdf') {
        file_put_contents('log.txt', "❌ Invalid file type: $mimeType\n", FILE_APPEND);
        header("Location: index.php?error=" . urlencode('Only PDF files are allowed'));
        exit;
    }


    // Validate file size
    if ($file['size'] > $maxFileSize) {
        file_put_contents('log.txt', "❌ File too large: {$file['size']} bytes\n", FILE_APPEND);
        header("Location: index.php?error=" . urlencode('File too large. Max 5MB allowed'));
        exit;
    }



    // Sanitize and rename
    $uniqueName = time() . "_" . $safeBase . '.pdf';
    $targetPath = $uploadDir . $uniqueName;


    if (move_uploaded_file($file['tmp_name'], $targetPath)) {
        file_put_contents('log.txt', "✅ File uploaded: $targetPath\n", FILE_APPEND);
        // Redirect to summarize.php with the uploaded file path
        $encodedFile = urlencode('uploads/' . $uniqueName);
        header("Location: summarize.php?file={$encodedFile}");
        exit;
    } else {
        file_put_contents('log.txt', "❌ Failed to move uploaded file.\n", FILE_APPEND);
        header("Location: index.php?error=Failed to save file");
        exit;
    }

} else {
    file_put_contents('log.txt', "❌ Invalid request method: " . $_SERVER['REQUEST_METHOD'] . "\n", FILE_APPEND);
    header("Location: index.php?error=Invalid request");
    exit;
}
?>