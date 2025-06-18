require 'sinatra/base'

enable :sessions

class AgendarController < Sinatra::Base
    set :views, File.expand_path('../../views', __FILE__)
    set :public_folder, File.expand_path('../../public', __dir__)
    set :static, true

    get '/agendar' do
        erb :'erb/agendar'
    end

    post 'agendar' do
        
    end
end