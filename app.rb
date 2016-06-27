ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require './models/user'
require 'sinatra/flash'
require 'sinatra/partial'

class App < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  register Sinatra::Partial

  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
    'Hello App!'
  end

  get '/user/new' do
    erb :signup
  end

  post '/user/new' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect('/welcome')
    else
      p @user.errors.full_messages
      flash.now[:errors] = @user.errors.full_messages
      erb :signup
    end
  end

  get '/welcome' do
    current_user
    erb :welcome
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
