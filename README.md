# Proyecto Wallet (nombre provisional)

Este proyecto es una aplicación web tipo billetera digital desarrollada en Ruby con el framework Sinatra. Permite a los usuarios registrarse, iniciar sesión y gestionar su sesión para eventualmente administrar sus finanzas. Además, en futuras versiones se integrarán funcionalidades para visualizar noticias financieras.

Actualmente, la aplicación cuenta con los siguientes puntos clave:

- Registro de usuarios mediante la ruta `/signup`.
- Inicio de sesión y manejo de sesiones con `/login`.
- Página principal protegida en `/index`.
- Persistencia de datos usando SQLite3.
- Autenticación básica mediante sesiones de Sinatra.

El backend está desarrollado utilizando Sinatra y SQLite3, y se maneja la autorización con sesiones.

## Tecnologías utilizadas

- Ruby
- Sinatra
- SQLite3
- Docker y Docker Compose para la ejecución del entorno

## Cómo ejecutar el proyecto

Para probar la aplicación localmente, se recomienda utilizar Docker Compose. Los pasos son:

1. Clonar este repositorio:

    ```bash
    git clone https://github.com/usuario/proyecto-wallet.git
    cd proyecto-wallet
    ```

2. Levantar el entorno con Docker Compose:

    ```bash
    sudo docker compose up
    ```

3. Una vez que el contenedor esté en funcionamiento, abrir un navegador y acceder a:

    ```
    http://localhost:9292
    ```

## Endpoints disponibles

- `GET /index` — Página principal, requiere sesión activa.
- `GET /login` — Formulario para iniciar sesión.
- `POST /login` — Procesa el inicio de sesión.
- `GET /signup` — Formulario para registrarse.
- `POST /signup` — Procesa el registro de un nuevo usuario.

## Participantes

- [Alfonso David](https://github.com/davidalfonso)
- [Budin Lautaro](https://github.com/Lautarobudin)
- [Cuesta Mateo](https://github.com/MateoCuesta)
- [Dellafiore Leon](https://github.com/Leonidas314)

## Futuras mejoras

- Gestión de saldos y transferencias.
- Historial de movimientos.
- Integración con APIs de noticias financieras.
- Mejora en la interfaz de usuario.
