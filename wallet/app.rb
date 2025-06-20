require 'sinatra/base'
require 'dotenv/load'
require_relative './config/environment'  # <-- debe ir antes
require_relative './app/controllers/auth_controller'
require_relative './app/controllers/dashboard_controller'
require_relative './app/controllers/index_controller'
require_relative './app/controllers/ingresar_dinero_controller'
require_relative './app/controllers/load_credit_controller'
require_relative './app/controllers/transfer_controller'
require_relative './app/controllers/agendar_controller'

class App < Sinatra::Base
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'clave_dev_segura'
  use Rack::MethodOverride

  use IndexController
  use AuthController
  use DashBoardController
  use IngresarDineroController
  use CargarDineroController
  use TransferController
  use AgendarController
  use Rack::MethodOverride
end
