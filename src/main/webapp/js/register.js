// IMAGE PREVIEW
const profileInput = document.getElementById("profilePic");
const preview = document.getElementById("preview");

profileInput.addEventListener("change", function () {
    const file = this.files[0];

    if (file) {
        const reader = new FileReader();

        reader.onload = function (e) {
            preview.src = e.target.result;
        };

        reader.readAsDataURL(file);
    }
});

// PASSWORD MATCH CHECK
document.getElementById("registerForm").addEventListener("submit", function(e) {
    const password = document.getElementById("password").value;
    const confirm = document.getElementById("confirmPassword").value;

    if (password !== confirm) {
        e.preventDefault();
        alert("Passwords do not match!");
    }
});