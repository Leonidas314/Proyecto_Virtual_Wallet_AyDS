document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('login-form');

  form.addEventListener('submit', async (event) => {
    event.preventDefault();

    const formData = new FormData(form);
    const data = {};
    formData.forEach((value, key) => data[key] = value);

    try {
      const response = await fetch('/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data),
        credentials: 'same-origin'
      });

      const result = await response.json();

      if (response.ok) {
        console.log('Login exitoso', result);
        window.location.href = '/dashboard'; // Redirige a donde quieras
      } else {
        alert(result.error);
      }
    } catch (err) {
      console.error('Error al iniciar sesión:', err);
    }
  });
});
