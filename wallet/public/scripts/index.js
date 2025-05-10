loginBtn = document.getElementById('loginBtn');
registerBtn = document.getElementById('registerBtn');

loginBtn.addEventListener("click", () => {
  window.location.href = '/login';
});

registerBtn.addEventListener("click", () => {
  window.location.href = '/signup';
});
