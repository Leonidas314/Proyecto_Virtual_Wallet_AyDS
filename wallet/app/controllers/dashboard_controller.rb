# controllers/dashboard_controller.rb

require 'sinatra/base'

class DashboardController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __dir__)

  get '/dashboard' do
    erb :'erb/dashboard'
  end
end
