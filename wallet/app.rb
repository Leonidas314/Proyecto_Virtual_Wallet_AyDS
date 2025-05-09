require_relative './config/environment'

use IndexController
use AuthController

run Rack::Builder.new {
  run Sinatra::Application
}