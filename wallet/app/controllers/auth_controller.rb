require 'sinatra/base'

class AuthController < Sinatra::Base
    set :views, File.expand_path('../../views', __FILE__)
    set :public_folder, File.expand_path('../../public', __dir__)
    set :static, true
    
    get '/login' do
       erb :'erb/login' 
    end

    get '/signup' do
        erb :'erb/signup'
    end

    post '/signup' do
        user = User.new(
        username: params[:username],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
        )

        if user.save
            session[:user_id] = user.id
            redirect '/dashboard' # o a donde quieras
        else
            erb :'erb/signup', locals: { error: "Error al registrar: #{user.errors.full_messages.join(', ')}" }
        end
    end
end