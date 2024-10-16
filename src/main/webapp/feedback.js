function selectStars(stars) {
    let elements = document.querySelectorAll(".stars");
    for (let i = 0; i < elements.length; i++) {
        if (i < stars) {
            elements[i].classList.add('selected');
        } else {
            elements[i].classList.remove('selected');
        }
    }
    document.getElementById('starsInput').value = stars.toString();
}

function validateForm() {
    const starsValue = document.getElementById('starsInput').value;
    const feedbackValue = document.getElementById('fb_note').value.trim();

    // Check if a star rating is selected
    if (!starsValue) {
        // Show alert prompt to the user if no stars are selected
        alert("Please select a star rating before submitting your feedback.");
        return false; // Prevent form submission
    }

    if (!feedbackValue) {
        alert("Please enter your feedback before submitting."); // Show alert prompt
        return false; // Prevent form submission
    }

    return true; // Allow form submission if validation passes
}