require 'sinatra/base'

class CargarDineroController < Sinatra::Base
  get '/api/cargar' do
    user_id = params[:user_id]
    amount = params[:amount].to_i

    user = User.find_by(id: user_id)
    halt 404, 'Usuario no encontrado' unless user

    puts 'user cargado: '
    puts user.inspect

    user.balance += amount
    user.save

    content_type :json
    { status: 'ok', nuevo_balance: user.balance }.to_json
  end
end
