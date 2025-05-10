# Usa una imagen base oficial de Ruby
FROM ruby:3.2

# Instala dependencias del sistema (incluye SQLite3 y herramientas para compilar gems nativas)
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libsqlite3-dev \
  sqlite3 \
  nodejs

# Crea y establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . /app

# Instala bundler y las dependencias del proyecto
RUN gem install bundler
RUN bundle install

# Expone el puerto en el que corre Sinatra por defecto (usualmente 9292 con rackup)
EXPOSE 9292

# Comando para ejecutar la app
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0"]