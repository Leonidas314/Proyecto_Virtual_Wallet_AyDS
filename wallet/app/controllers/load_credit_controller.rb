require 'sinatra/base'

class CargarDineroController < Sinatra::Base
  post '/api/cargar' do
    user_id = params[:user_id]
    amount = params[:amount].to_i

    puts "[#{Time.now}] Intento de carga → user_id=#{user_id}, amount=#{amount}"

    user = User.find_by(id: user_id)
    unless user
      puts "[#{Time.now}] Usuario no encontrado con id=#{user_id}"
      halt 404, 'Usuario no encontrado'
    end

    puts "[#{Time.now}] Usuario encontrado: #{user.email} (balance actual: #{user.balance})"

    user.balance += amount
    user.save

    puts "[#{Time.now}] Carga completada: +#{amount} → Nuevo balance: #{user.balance}"

    content_type :json
    { status: 'ok', nuevo_balance: user.balance }.to_json
  end
end