require 'sinatra/base'

class DashBoardController < Sinatra::Base
  enable :sessions
  set :views, File.expand_path('../../views', __FILE__)

  get '/dashboard' do
   if session[:user_id]
    @user = User.find_by(id: session[:user_id])
    if @user
      erb :'erb/dashboard'
    else
      session.clear
      redirect '/login'
    end
  else
    redirect '/login'

    end
  end
end