<?php
// Enhanced process.php with Bootstrap UI, error handling, and download option
function alert($type, $msg) {
    return "<div class='alert alert-$type alert-dismissible fade show' role='alert'>"
        . htmlspecialchars($msg) .
        "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>";
}

$output = '';
$summaryFile = '';
$error = '';

if (isset($_FILES['pdf']) && $_FILES['pdf']['error'] === 0) {
    $fileName = preg_replace('/[^a-zA-Z0-9_\-.]/', '_', basename($_FILES['pdf']['name']));
    $fileExt = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
    if ($fileExt !== 'pdf') {
        $error = 'Only PDF files are allowed.';
    } else {
        $uploadDir = __DIR__ . '/uploads/';
        if (!is_dir($uploadDir)) mkdir($uploadDir, 0755, true);
        $uniqueName = time() . '_' . $fileName;
        $uploadPath = $uploadDir . $uniqueName;
        if (move_uploaded_file($_FILES['pdf']['tmp_name'], $uploadPath)) {
            $escapedPath = escapeshellarg($uploadPath);
            // Call Python script (default to medium summary)
            $output = shell_exec("python summarize.py $escapedPath medium");
            // Save summary to file
            $summaryDir = __DIR__ . '/summaries/';
            if (!is_dir($summaryDir)) mkdir($summaryDir, 0755, true);
            $summaryFile = $summaryDir . pathinfo($uniqueName, PATHINFO_FILENAME) . '_summary.txt';
            file_put_contents($summaryFile, $output);
        } else {
            $error = 'Failed to save uploaded file.';
        }
    }
} else {
    $error = 'No file uploaded or upload error.';
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Summary Result</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="mb-4">
        <a href="index.php" class="btn btn-outline-primary">&larr; Back to Home</a>
        <a href="summaries.php" class="btn btn-outline-secondary ms-2">🗂️ View Summaries</a>
    </div>
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-body p-4">
                    <h2 class="mb-4 text-success text-center">Summary Result</h2>
                    <?php if ($error): ?>
                        <?= alert('danger', $error) ?>
                    <?php elseif ($output): ?>
                        <pre class="bg-light p-3 rounded mb-3" style="white-space: pre-wrap; font-size:1.1rem;"><?= htmlspecialchars($output) ?></pre>
                        <?php if ($summaryFile && file_exists($summaryFile)): ?>
                            <a href="summaries/<?= urlencode(basename($summaryFile)) ?>" class="btn btn-success me-2" download>⬇️ Download Summary</a>
                        <?php endif; ?>
                        <a href="index.php" class="btn btn-primary">Summarize Another PDF</a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>