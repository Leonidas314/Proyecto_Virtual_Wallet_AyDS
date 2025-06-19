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
        cvu = params[:cvu]
      
        contact = Contact.new(user: user, name: name, cvu: cvu)
      
        if contact.save
          redirect '/dashboard'
        else
            @error = contact.errors.full_messages.join(', ')
            erb :'erb/agendar'
        end
    end

end