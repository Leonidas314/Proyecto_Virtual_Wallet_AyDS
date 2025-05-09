require './config/environment.rb' # Carga el entorno (gemas, controladores, etc.)

require './app/controllers/index_controller.rb'
require './app/controllers/auth_controller.rb'
use UsersController # Le dice a Rack qué clase manejará las rutas
use AuthController

run Sinatra::Application