document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('upload-form');
    const alertBox = document.getElementById('alert-box');

    function showAlert(message, type = 'info') {
        alertBox.innerHTML = `
            <div class="alert alert-${type}" role="alert">
                ${message}
            </div>
        `;
        alertBox.style.opacity = '1';

        setTimeout(() => {
            alertBox.style.opacity = '0';
        }, 5000);
    }

    form.addEventListener('submit', (e) => {
        const fileInput = document.querySelector('input[type="file"]');
        const file = fileInput.files[0];

        if (!file || file.type !== "application/pdf") {
            e.preventDefault();
            showAlert("Please upload a valid PDF file.", "danger");
        } else {
            showAlert("Uploading & processing your file...", "primary");
        }
    });
});