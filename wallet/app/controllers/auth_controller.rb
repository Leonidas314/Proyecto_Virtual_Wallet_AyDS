require 'sinatra/base'
require 'json'

enable :sessions

class AuthController < Sinatra::Base
    set :views, File.expand_path('../../views', __FILE__)
    set :public_folder, File.expand_path('../../public', __dir__)
    set :static, true
    
    get '/login' do
       erb :'erb/login' 
    end

    get '/signup' do
        erb :'erb/signup'
    end

    post '/login' do
      data = JSON.parse(request.body.read)
      user = User.find_by(email: data["email"])

      if user && user.authenticate(data["password"])
        session[:user_id] = user.id
        status 200

        content_type :json
        { message: "Login exitoso", user: { id: user.id, name: user.name, email: user.email } }.to_json
      else
        status 401
        content_type :json
        { error: "Email o contraseña incorrectos" }.to_json
      end
    end

    post '/signup' do
        data = JSON.parse(request.body.read)

        user = User.new(
            name: data["name"],
            email: data["email"],
            phone: data["phone"],
            cvu: data["cvu"],
            balance: data["balance"] || 0,
            password: data["password"],
            password_confirmation: data["password_confirmation"]
        )

        if User.find_by(email: data["email"])
            status 409
            return { error: "El email ya está registrado" }.to_json
        end

        if user.save
            status 201
            content_type :json
            { message: "Usuario creado exitosamente", user: user }.to_json
        else
            status 422
            content_type :json
            { errors: user.errors.full_messages }.to_json
        end
    end
end