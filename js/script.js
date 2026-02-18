document.addEventListener('DOMContentLoaded', function () {
    const passwordToggles = document.querySelectorAll('.togglePassword');

    passwordToggles.forEach(toggle => {
        toggle.addEventListener('click', function () {
            // On remonte au parent (.password-wrapper) 
            // puis on cherche l'input à l'intérieur
            const wrapper = this.closest('.password-wrapper');
            const input = wrapper.querySelector('input');

            if (input) {
                const isPassword = input.type === 'password';
                input.type = isPassword ? 'text' : 'password';

                // Bascule de l'icône
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            }
        });
    });
});