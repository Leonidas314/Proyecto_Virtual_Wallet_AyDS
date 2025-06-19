require 'sinatra/base'

class AgendarController < Sinatra::Base
    set :views, File.expand_path('../../views', __FILE__)
    set :public_folder, File.expand_path('../../public', __dir__)

    get '/agendar' do
        erb :'erb/agendar'
    end

    post '/agendar' do
        user_id = session[:user_id]
        user = User.find_by(id: user_id)
        name = params[:name]
        cvu  = params[:cvu]
      
        if name.nil? || name.strip.empty?
          @error = "El nombre no puede estar vacío."
          return erb :'erb/agendar'
        end
      
        destinatario = User.find_by(cvu: cvu)
      
        if destinatario.nil?
          @error = "El CVU ingresado no pertenece a ningún usuario."
          return erb :'erb/agendar'
        end

        contacto = Contact.new(user: user, name: name, cvu: cvu)

        if contacto.save
            redirect '/dashboard'
        else
          @error = contacto.errors.full_messages.join(', ')
          erb :'erb/agendar'
        end
      end
      
      get '/contactos' do
        user_id = session[:user_id]
        user = User.find_by(id: user_id)
        @contactos = user.contacts 
        erb :'erb/contactos'
      end
end