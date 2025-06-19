require 'sinatra/base'

class AgendarController < Sinatra::Base
    set :views, File.expand_path('../../views', __FILE__)
    set :public_folder, File.expand_path('../../public', __dir__)

    get '/agendar' do
        erb :'erb/agendar'
    end

    post '/agendar' do
        name = params[:name]
        cvu = params[:cvu]
      
        contact = Contact.new(name: name, cvu: cvu)
      
        if contact.save
          redirect '/dashboard'
        else
          status 422
          erb :'erb/agendar', locals: { error: "Hubo un problema al guardar el contacto." }
        end
    end

end