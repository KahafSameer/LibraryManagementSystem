<?php
// summarize.php

// Enable error display for debugging
ini_set('display_errors', 1);
error_reporting(E_ALL);

file_put_contents('log.txt', "✅ Entered summarize.php - " . date('Y-m-d H:i:s') . "\n", FILE_APPEND);

// Check if file is provided
if (!isset($_GET['file']) || empty($_GET['file'])) {
    file_put_contents('log.txt', "❌ No file specified in URL\n", FILE_APPEND);
    echo "<h3>❌ No file specified.</h3>";
    exit;
}

$filePath = urldecode($_GET['file']);
$fullPath = __DIR__ . DIRECTORY_SEPARATOR . $filePath;

// Check if file exists
if (!file_exists($fullPath)) {
    file_put_contents('log.txt', "❌ File not found: $fullPath\n", FILE_APPEND);
    echo "<h3>❌ Uploaded file not found.</h3>";
    exit;
}

// Escape shell arguments
$escapedPath = escapeshellarg($fullPath);
$pythonScript = __DIR__ . DIRECTORY_SEPARATOR . 'summarize.py';
$escapedScript = escapeshellarg($pythonScript);

// Final Python command with stderr redirect
$command = "python $escapedScript $escapedPath 2>&1";
file_put_contents('log.txt', "ℹ️ Running command: $command\n", FILE_APPEND);

// Execute Python command and capture output
$output = shell_exec($command);

// Log full Python output
file_put_contents('python_debug.txt', $output);

// If no output, report error
if (!$output || trim($output) === '') {
    file_put_contents('log.txt', "⚠️ No summary returned from Python script.\n", FILE_APPEND);
    echo "<h3>⚠️ Error: No summary returned. Please check Python errors or API limits.</h3>";
    exit;
}

// Save to summaries/ folder
$summaryDir = __DIR__ . '/summaries/';
if (!is_dir($summaryDir)) {
    mkdir($summaryDir, 0755, true);
}

$summaryFile = $summaryDir . basename($filePath, '.pdf') . '_summary.txt';
file_put_contents($summaryFile, $output);
file_put_contents('log.txt', "✅ Summary saved to: $summaryFile\n", FILE_APPEND);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>📘 Summary Result</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .spinner-overlay {
            position: fixed;
            top: 0; left: 0; width: 100vw; height: 100vh;
            background: rgba(255,255,255,0.8);
            display: flex; align-items: center; justify-content: center;
            z-index: 9999;
        }
    </style>
</head>
<body class="bg-light">
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="index.php">📄 AI PDF Summarizer</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="summaries.php">🗂️ View Summaries</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

    <div id="spinner" class="spinner-overlay">
        <div class="text-center">
            <div class="spinner-border text-success" style="width: 4rem; height: 4rem;" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            <div class="mt-3 fs-4">Generating summary...</div>
        </div>
    </div>
    <div class="container py-5" style="display:none;" id="summary-container">
        <div class="row justify-content-center">
            <div class="col-lg-9 col-xl-8">
                <div class="card shadow-lg border-0 rounded-4">
                    <div class="card-body p-4">
                        <h1 class="mb-4 text-center text-success display-5">✅ Summary Generated</h1>
                        <div class="mb-3 text-center">
                            <span class="badge bg-primary-subtle text-primary-emphasis rounded-pill px-3 py-2">
                                <?= htmlspecialchars(basename($filePath)) ?>
                            </span>
                        </div>
                        <pre style="white-space: pre-wrap; font-size:1.1rem; background:#f8f9fa; border-radius:6px; padding:1rem; max-height:60vh; overflow:auto;"><?= htmlspecialchars($output, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') ?></pre>
                        <div class="d-flex flex-wrap justify-content-between mt-4 gap-2">
                            <a href="index.php" class="btn btn-primary flex-fill"><span class="me-1">🔙</span>Go Back</a>
                            <a href="summaries.php" class="btn btn-secondary flex-fill"><span class="me-1">🗂️</span>All Summaries</a>
                            <?php
                                // Make download link relative to web root
                                $summaryWebPath = 'summaries/' . urlencode(basename($summaryFile));
                            ?>
                            <a href="<?= $summaryWebPath ?>" download class="btn btn-success flex-fill"><span class="me-1">⬇️</span>Download Summary</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Hide spinner and show summary after DOM loads
        window.addEventListener('DOMContentLoaded', function() {
            document.getElementById('spinner').style.display = 'none';
            document.getElementById('summary-container').style.display = 'block';
        });
    </script>
</body>
</html>