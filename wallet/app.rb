require_relative './config/environment'

enable :sessions
set :session_secret, 'clave_Secreta!.234a#4?'

use IndexController
use AuthController
use DashBoardController
#run Rack::Builder.new {
#  run Sinatra::Application
#} Si usamos use controllers no es necesario run Rack