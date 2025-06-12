require 'sinatra/base'
require 'rqrcode'
require 'chunky_png'

class IngresarDineroController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __dir__)
  set :static, true

  get '/ingresarDinero' do
    user_id = session[:user_id] || 1 # Simulación por ahora

    amount = params[:amount]
    if amount
      @qr_text = "http://localhost:4567/api/cargar?user_id=#{user_id}&amount=#{amount}"
    end

    erb :'erb/ingresarDinero'
  end

  get '/qr' do
    content_type 'image/png'

    text = params[:text] || "https://prueba.com"
    qr = RQRCode::QRCode.new(text)

    qr.as_png(size: 300).to_s
  end
end