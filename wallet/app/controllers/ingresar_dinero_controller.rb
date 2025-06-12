require 'sinatra/base'
require 'rqrcode'
require 'chunky_png'

class IngresarDineroController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __dir__)
  set :static, true

  get '/ingresarDinero' do
    erb :'erb/ingresarDinero'
  end

  post '/ingresarDinero' do
    user_id = session[:user_id] || 1

    amount = params[:amount]
    if amount
      @qr_text = "http://192.168.100.36:9292/confirmarCarga?user_id=#{user_id}&amount=#{amount}"
    end

    erb :'erb/ingresarDinero'
  end

  get '/qr' do
    content_type 'image/png'

    text = params[:text] || "https://prueba.com"
    qr = RQRCode::QRCode.new(text)

    qr.as_png(size: 300).to_s
  end

  get '/confirmarCarga' do
    @user_id = params[:user_id]
    @amount = params[:amount]

    erb :'erb/confirmarCarga'
  end

end