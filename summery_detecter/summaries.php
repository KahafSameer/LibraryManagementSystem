<?php
// summaries.php

$summaryDir = __DIR__ . '/summaries/';
$files = [];
if (is_dir($summaryDir)) {
    $files = array_filter(scandir($summaryDir), function($f) use ($summaryDir) {
        return is_file($summaryDir . $f) && strtolower(pathinfo($f, PATHINFO_EXTENSION)) === 'txt';
    });
    sort($files);
}

$search = isset($_GET['search']) ? strtolower(trim($_GET['search'])) : '';
if ($search) {
    $files = array_filter($files, function($f) use ($search) {
        return strpos(strtolower($f), $search) !== false;
    });
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>📄 Summaries List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="#">🗂️ Summaries</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.php">🏠 Home</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-body p-4">
                    <h2 class="mb-4 text-center text-primary">🗂️ All Summaries</h2>
                    <form class="mb-4" method="get" action="">
                        <div class="input-group">
                            <input type="text" class="form-control" name="search" placeholder="Search by file name..." value="<?= htmlspecialchars($search) ?>">
                            <button class="btn btn-primary" type="submit">Search</button>
                        </div>
                    </form>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle">
                            <thead class="table-primary">
                                <tr>
                                    <th>File Name</th>
                                    <th style="width:220px;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php if (empty($files)): ?>
                                <tr><td colspan="2" class="text-center text-muted">No summaries found.</td></tr>
                            <?php else: ?>
                                <?php foreach ($files as $file): ?>
                                    <tr>
                                        <td class="align-middle"><span class="fw-semibold text-dark-emphasis"><?= htmlspecialchars($file) ?></span></td>
                                        <td>
                                            <a href="summaries/<?= urlencode($file) ?>" class="btn btn-success btn-sm me-2" download>⬇️ Download</a>
                                            <a href="summaries/<?= urlencode($file) ?>" class="btn btn-secondary btn-sm me-2" target="_blank">🔍 View</a>
                                            <button type="button" class="btn btn-info btn-sm text-white" data-bs-toggle="modal" data-bs-target="#previewModal" data-file="<?= htmlspecialchars($file) ?>">👁️ Preview</button>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Preview Modal -->
<div class="modal fade" id="previewModal" tabindex="-1" aria-labelledby="previewModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="previewModalLabel">Summary Preview</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modalSummaryContent">
        <div class="text-center text-muted">Loading...</div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
// Preview summary in modal
const previewModal = document.getElementById('previewModal');
if (previewModal) {
  previewModal.addEventListener('show.bs.modal', function (event) {
    const button = event.relatedTarget;
    const file = button.getAttribute('data-file');
    const modalBody = document.getElementById('modalSummaryContent');
    modalBody.innerHTML = '<div class="text-center text-muted">Loading...</div>';
    fetch('summaries/' + encodeURIComponent(file))
      .then(resp => resp.ok ? resp.text() : 'Error loading summary.')
      .then(text => {
        modalBody.innerHTML = '<pre style="white-space:pre-wrap;">' +
          (text.length > 20000 ? text.substring(0, 20000) + '\n... (truncated)' : text) + '</pre>';
      })
      .catch(() => {
        modalBody.innerHTML = '<div class="text-danger">Failed to load summary.</div>';
      });
  });
}
</script>
</body>
</html>
