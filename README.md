# 🐂 BullWallet

Este proyecto es una aplicación web tipo billetera digital desarrollada en Ruby con el framework Sinatra. Permite a los usuarios registrarse, iniciar sesión y gestionar su sesión para eventualmente administrar sus finanzas. Además, en futuras versiones se integrarán funcionalidades para visualizar noticias financieras.

Actualmente, la aplicación cuenta con los siguientes puntos clave:

- 🔐 Registro de usuarios mediante la ruta `/signup`.
- 🔑 Inicio de sesión y manejo de sesiones con `/login`.
- 🏠 Página principal en `/index`.
- 💾 Persistencia de datos usando SQLite3.
- 🔒 Autenticación básica mediante sesiones de Sinatra.
- 💸 Generación de código QR para cargar saldo desde el celular.
- 📲 Interfaz para confirmar la carga y actualizar el balance del usuario.

El backend está desarrollado utilizando Sinatra y SQLite3, y se maneja la autorización con sesiones.

## 🛠 Tecnologías utilizadas

- 💎 Ruby
- 🌐 Sinatra
- 🗄 SQLite3
- 📦 RQRCode + ChunkyPNG para generación de códigos QR
- 🐳 Docker y Docker Compose para la ejecución del entorno

## 🚀 Cómo ejecutar el proyecto

Para probar la aplicación localmente, se recomienda utilizar Docker Compose. Los pasos son:

1. 📥 Clonar este repositorio:

    ```bash
    git clone https://github.com/usuario/proyecto-wallet.git
    cd proyecto-wallet
    ```

2. 🐳 Levantar el entorno con Docker Compose:

    ```bash
    sudo docker compose up
    ```

3. 🌐 Una vez que el contenedor esté en funcionamiento, abrir un navegador y acceder a:

    ```
    http://localhost:9292
    ```

## 💸 Cómo funciona la carga de dinero por QR

1. Desde el dashboard, el usuario hace clic en **"Ingresar Dinero"**.
2. Es redirigido a una vista donde ingresa el monto deseado.
3. Se genera un código QR con un enlace que apunta a `/confirmarCarga`.
4. Al escanear el código con el celular, se accede a una página de confirmación de carga.
5. Al confirmar, el servidor actualiza el balance del usuario en la base de datos.

> ✅ **Importante:** Para que el código QR funcione desde otro dispositivo, la IP debe ser accesible desde la red local. Se recomienda usar `host.docker.internal` en desarrollo o configurar correctamente la IP en el backend.

## 📡 Endpoints disponibles

- `GET /index` — 🏠 Página principal, requiere sesión activa.
- `GET /login` — 🔐 Formulario para iniciar sesión.
- `POST /login` — 🔑 Procesa el inicio de sesión.
- `GET /signup` — ✍️ Formulario para registrarse.
- `POST /signup` — 📝 Procesa el registro de un nuevo usuario.
- `GET /ingresarDinero` — 💸 Vista para cargar dinero (GET solo en pruebas).
- `POST /ingresarDinero` — 💸 Genera el QR para cargar saldo.
- `GET /confirmarCarga` — ✅ Confirma y aplica el ingreso de dinero.

## 👥 Participantes

- [Alfonso David](https://github.com/Dvalfonso)
- [Budin Lautaro](https://github.com/Lautarobudin)
- [Cuesta Mateo](https://github.com/MateoCuesta)
- [Dellafiore Leon](https://github.com/Leonidas314)

## 🔮 Futuras mejoras

- 💰 Gestión completa de saldos y transferencias entre usuarios.
- 📜 Historial de movimientos financieros.
- 🎨 Mejora en la interfaz de usuario con diseño responsivo.
