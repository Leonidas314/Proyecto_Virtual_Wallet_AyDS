document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('signup-form');

  form.addEventListener('submit', async (event) => {
    event.preventDefault(); // evitar envío tradicional

    const formData = new FormData(form);
    const data = {};
    formData.forEach((value, key) => {
      data[key] = value;
    });

    try {
      const response = await fetch('/signup', {  // Cambia la ruta según corresponda
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
        credentials: 'same-origin'  // para enviar cookies / sesión
      });

      if (!response.ok) throw new Error(`Error en el servidor: ${response.status}`);

      const result = await response.json();
      console.log('Registro exitoso:', result);
      window.location.href = '/login';

    } catch (error) {
      console.error('Error al enviar formulario:', error);
    }
  });
});