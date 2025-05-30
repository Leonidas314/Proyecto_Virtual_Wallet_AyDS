require './config/environment.rb'

require './app/controllers/index_controller.rb'
require './app/controllers/auth_controller.rb'
require './app/controllers/dashboard_controller.rb'

use Rack::Session::Cookie, key: 'rack.session',
                           path: '/',
                           secret: ENV['SESSION_SECRET'] || 'supersecret123'

use AuthController
use DashBoardController
use IndexController

run Rack::URLMap.new(
  "/" => IndexController.new,
  "/auth" => AuthController.new,
  "/dashboard" => DashBoardController.new
)