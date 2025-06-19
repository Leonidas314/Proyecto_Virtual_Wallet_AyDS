require 'sinatra/base'
require 'rqrcode'
require 'chunky_png'
require 'socket'

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
      ip = local_ip
      puts "IP local generada para QR: #{ip}"
      @qr_text = "http://#{ip}:9292/confirmarCarga?user_id=#{user_id}&amount=#{amount}"
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

    user = User.find_by(id: @user_id)

    if user && @amount.to_f > 0
      TransferMediator.create!(
        from_user_id: nil,
        to_user_id: user.id,
        amount: @amount.to_f
      )
      @success = "Ingreso de $#{@amount} registrado con éxito."
    else
      @error = "Error al registrar el ingreso."
    end

    erb :'erb/confirmarCarga'
  end

  def local_ip
    UDPSocket.open do |s|
      s.connect('8.8.8.8', 1)
      s.addr.last
    end
  end

end