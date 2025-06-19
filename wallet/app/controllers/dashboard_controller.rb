require 'sinatra/base'
require 'net/http'
require 'json'

class DashBoardController < Sinatra::Base
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
        @dollars = get_dollars

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

  get '/historial' do
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])

      if @user
        @transfers = TransferMediator.where("from_user_id = ? OR to_user_id = ?", @user.id, @user.id).order(created_at: :desc)
        erb :'erb/historial'
      else
        session.clear
        redirect '/login'
      end
    else
      redirect '/login'
    end
  end

  def get_dollars
    url = URI("https://dolarapi.com/v1/dolares")
    response = Net::HTTP.get(url)
    JSON.parse(response)
  end
end