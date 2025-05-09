require 'bundler/setup'
Bundler.require

# Cargar todos los archivos de la app (modelos, controladores, servicios)
Dir[File.expand_path('../app/**/*.rb', __dir__)].each { |file| require file }