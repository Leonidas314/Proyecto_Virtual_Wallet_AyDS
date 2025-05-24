require_relative './config/environment'
require 'dotenv/load'

enable :sessions
set :session_secret, ENV['SESSION_SECRET']

use IndexController
use AuthController
use DashBoardController