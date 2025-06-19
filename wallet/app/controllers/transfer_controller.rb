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
    cvu = params[:to_cvu]
    amount = params[:amount].to_f
    to_user = User.find_by(cvu: cvu)

    if to_user.nil?
      @error = "CVU destino no válido."
      @show_form = false
    else
      begin
        TransferMediator.transferir(from_user, to_user, amount)
        @success = "Transferencia de $#{amount} realizada con éxito."
        @show_form = false
      rescue ArgumentError => e
        @error = e.message
        @show_form = false
      rescue ActiveRecord::RecordInvalid => e
        @error = "Error de validación: #{e.message}"
        @show_form = false
      end
    end
    erb :'erb/transfer'
  end
end
