<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AI PDF Summarizer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Styles -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assests/css/style.css">
</head>

<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm position-relative">
  <div class="container-fluid">
    <!-- Back Icon Button -->
    <button type="button" class="btn btn-link text-white p-0 me-3 d-flex align-items-center" onclick="redirectAndClose()" style="font-size:1.7rem; position:absolute; left:18px; top:50%; transform:translateY(-50%); z-index:2;">
      <span class="bi bi-book" style="font-size:1.7rem;"></span>
    </button>
    <a class="navbar-brand fw-bold ms-5" href="#">📄 AI PDF Summarizer</a>
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

<div class="container min-vh-100 d-flex flex-column justify-content-center align-items-center py-4">
    <div class="w-100" style="max-width: 440px;">
        <!-- Back Button moved to navbar -->
        <div class="card shadow-lg border-0 rounded-4 mt-5">
            <div class="card-body p-4">
                <h2 class="text-center mb-4 fw-bold text-primary">📄 AI PDF Summarizer</h2>
                <p class="text-center text-muted mb-4">Upload a PDF and get a smart summary in seconds.</p>
                <?php if (isset($_GET['error'])): ?>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <?php echo htmlspecialchars($_GET['error']); ?>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <?php elseif (isset($_GET['success'])): ?>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <?php echo htmlspecialchars($_GET['success']); ?>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <?php endif; ?>

                <form id="uploadForm" action="upload.php" method="POST" enctype="multipart/form-data" autocomplete="off">
                    <div class="mb-3">
                        <label for="pdf" class="form-label fw-semibold">Select a PDF file to summarize</label>
                        <input type="file" name="pdf" id="pdf" class="form-control form-control-lg" accept="application/pdf" required>
                        <div id="fileNamePreview" class="form-text text-primary mt-1"></div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 btn-lg mt-2">📤 Upload & Summarize</button>
                </form>
                <div class="text-center mt-3 d-none" id="loading">
                    <div class="spinner-border text-primary" role="status"></div>
                    <p class="mt-2 text-muted">Processing your PDF, please wait...</p>
                </div>
            </div>
        </div>
        <div class="text-center mt-4">
            <p class="text-muted small mb-0">Powered by <span class="fw-semibold">Amhar Shaheen</span>, <span class="fw-semibold">Python</span> & <span class="fw-semibold">Llama</span></p>
        </div>
    </div>
</div>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- Scripts -->
<script>
    // Show spinner on upload
    document.getElementById('uploadForm').addEventListener('submit', function () {
        document.getElementById('loading').classList.remove('d-none');
    });

    // Show selected file name
    document.getElementById('pdf').addEventListener('change', function (e) {
        const fileName = e.target.files[0] ? e.target.files[0].name : '';
        document.getElementById('fileNamePreview').textContent = fileName ? `Selected: ${fileName}` : '';
    });

    // Back button logic: always go to main index and close this tab
    function redirectAndClose() {
        window.open('/LibraryManagementSystem/index.php', '_self');
        setTimeout(function() { window.close(); }, 200);
    }
</script>
<script src="assests/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
