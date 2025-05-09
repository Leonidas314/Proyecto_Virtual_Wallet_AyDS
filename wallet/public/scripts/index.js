loginBtn = document.getElementById('loginBtn');

loginBtn.addEventListener("click", () => {
  fetch('/login')
  .then(response => response.text())  // Esperamos HTML
  .then(html => {
    document.body.innerHTML = html;
  })
  .catch(error => {
    console.error('Error al cargar la página de login:', error);
  });
});