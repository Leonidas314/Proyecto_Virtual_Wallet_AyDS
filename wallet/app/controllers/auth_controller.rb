require 'sinatra/base'

class AuthController < Sinatra::Base
    set :views, File.expand_path('../../views', __FILE__)
    set :public_folder, File.expand_path('../../public', __dir__)
    set :static, true
    
    get '/login' do
       erb :'erb/login' 
    end
end