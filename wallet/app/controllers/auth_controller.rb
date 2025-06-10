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
        email = params[:email]
        password = params[:password]
          
        user = User.find_by(email: email)

        if user && user.authenticate(password)
            session[:user_id] = user.id
            status 200

            content_type :json
            { message: "Login exitoso", user: { id: user.id, name: user.name, email: user.email } }.to_json
            redirect '/dashboard'
        else
            status 401
            content_type :json
            { error: "Email o contraseña incorrectos" }.to_json
        end
    end

    post '/signup' do
        user = User.new(
            name: params[:name],
            email: params[:email],
            phone: params[:phone],
            password: params[:password],
            password_confirmation: params[:password_confirmation]
        )

        if User.find_by(email: params[:email])
            status 409
            return { error: "El email ya está registrado" }.to_json
        end

        if user.save
            Account.create!(user_id: user.id, tipo: params[:account_type], balance: 0)
            status 201
            content_type :json
            { message: "Usuario creado exitosamente", user: user }.to_json
            redirect "/login"
        else
            status 422
            content_type :json
            { errors: user.errors.full_messages }.to_json
        end
    end

    post "/logout" do
        session.clear
        redirect "/index"
    end
end
