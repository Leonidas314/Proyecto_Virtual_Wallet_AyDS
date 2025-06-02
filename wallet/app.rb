require 'dotenv/load'
require_relative './config/environment'
require_relative './controllers/auth_controller'
require_relative './controllers/dashboard_controller'
require_relative './controllers/index_controller'


enable :sessions
set :session_secret, ENV['SESSION_SECRET']

use IndexController
use AuthController
use DashBoardController