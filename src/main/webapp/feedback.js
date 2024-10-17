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
    const feedbackValue = document.getElementById('fbMsg').value.trim();
    //const maxCharLimit = 500;
	
	if (!starsValue && !feedbackValue) {
	        // Show alert prompt to the user if no stars are selected
	        alert("Please select a star rating and type a feedback message before submitting your feedback.");
	        return false; // Prevent form submission
	    }

    // Check if a star rating is selected
    if (!starsValue) {
        // Show alert prompt to the user if no stars are selected
        alert("Please select a star rating before submitting your feedback.");
        return false; // Prevent form submission
    }

    if (!feedbackValue) {
        alert("Please type a feedback message before submitting your feedback."); // Show alert prompt
        return false; // Prevent form submission
    }

    // if (feedbackValue.length > maxCharLimit) {
    //     alert(`Your feedback exceeds the character limit of ${maxCharLimit} characters. Please shorten your message.`);
    //     return false; // Prevent form submission
    // }

    return true; // Allow form submission if validation passes
}

// document.getElementById('fbMsg').addEventListener('input', function () {
//     const maxChars = 500;
//     const currentLength = this.value.length;
//     document.getElementById('charCounter').textContent = `${currentLength}/${maxChars}`;
    
//     if (currentLength > maxChars) {
// 		this.value = this.value.slice(0, maxChars);
//         alert(`Your feedback exceeds the character limit of ${maxChars} characters. Please shorten your message.`);
//         charCounter.textContent = `${maxChars}/${maxChars}`;
//     }
// });

document.addEventListener('DOMContentLoaded', function () {
    const textarea = document.getElementById('fbMsg');
    const charCounter = document.getElementById('charCounter');
    const maxChars = 500;

    // Set initial character count based on the loaded feedback
    const currentLength = textarea.value.length;
    charCounter.textContent = `${currentLength}/${maxChars}`;

    // Handle input events to update character count and limit input
    textarea.addEventListener('input', function () {
        const currentLength = this.value.length;
        
        // Update character counter
        charCounter.textContent = `${currentLength}/${maxChars}`;
        
        // If current length exceeds maxChars, trim the input and alert the user
        if (currentLength > maxChars) {
            this.value = this.value.slice(0, maxChars); // Trim excess characters
            charCounter.textContent = `${maxChars}/${maxChars}`; // Reset counter to max
            alert(`Your feedback exceeds the character limit of ${maxChars} characters. Please shorten your message.`);
        }
    });
});