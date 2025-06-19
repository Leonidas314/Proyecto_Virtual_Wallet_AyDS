require 'sinatra/base'

class TransferController < Sinatra::Base
  

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __dir__)
  # Muestra el formulario de transferencia
    get '/transfer' do 
        erb :'erb/transfer'
    end

  # Procesa la transferencia
    post '/transfer' do

        user_id = session[:user_id]
        from_user = User.find_by(id: user_id)
        puts "DEBUG user_id by session:"
        puts user_id.inspect
        puts "DEBUG from_user inspect:"
        puts from_user.inspect
        cvu = params[:to_cvu]
        amount = params[:amount].to_f
        to_user = User.find_by(cvu: cvu)
        puts "DEBUG user finded by cbu:"
        puts to_user.inspect
        if to_user.nil?
          @error = "CVU destino no válido."
        else
        begin
          TransferMediator.transferir(from_user, to_user, amount)
          @success = "Transferencia de $#{amount} realizada con éxito."
        rescue ArgumentError => e
          @error = e.message
        rescue ActiveRecord::RecordInvalid => e
          @error = "Error de validación: #{e.message}"
        end
        end
    end


end
