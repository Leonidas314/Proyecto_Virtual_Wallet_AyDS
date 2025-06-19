require 'sinatra/base'
require 'sinatra/activerecord'

class IndexController < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __dir__)

  get '/' do
    erb :'erb/index'
  end

  get '/index' do
    erb :'erb/index'
  end
end
