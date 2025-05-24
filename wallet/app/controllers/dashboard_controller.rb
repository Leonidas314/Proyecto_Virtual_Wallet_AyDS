require 'sinatra/base'

class DashBoardController < Sinatra::Base
  enable :sessions

  set :session_secret, ENV['SESSION_SECRET']

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __dir__)
  set :static, true

  get '/dashboard' do
    puts "Secret cargado: #{ENV['SESSION_SECRET']}"
    puts "Session content: #{session.inspect}"

    if session[:user_id]
      puts "session[:user_id] está presente: #{session[:user_id]}"

      @user = User.find_by(id: session[:user_id])
      if @user
        puts "Usuario encontrado: #{@user.email}"

        erb :'erb/dashboard'
      else
        puts "No se encontró usuario con ID #{session[:user_id]}, limpiando sesión y redirigiendo a login"

        session.clear
        redirect '/login'
      end
    else
      puts "session[:user_id] no está presente, redirigiendo a login"

      redirect '/login'

      end
    end
end