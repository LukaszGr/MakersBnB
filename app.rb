ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require './models/user'
require './models/space'
require './models/booking'
require 'sinatra/flash'
require 'sinatra/partial'

class App < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  register Sinatra::Partial

  set :partial_template_engine, :erb
  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @all_spaces = Space.all
    erb :index
  end

  get '/space/new' do
    erb :'spaces/new'
  end

  post '/space' do
    current_user
    @space = Space.create(name: params[:name], description: params[:description], price_per_night: params[:price_per_night], user_id: current_user.id)
    redirect '/'
  end

  get '/user/new' do
    erb :signup
  end

  post '/user/new' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :signup
    end
  end

  get '/session/new' do
    erb :login
  end

  post '/session/new' do
    @user = User.authenticate(params[:email],params[:password])
    if @user
      session[:user_id] = @user.id
      redirect('/')
    else
      flash.now[:errors] = ['This email/password combination does not exist']
      erb :login
    end
  end

  post '/session/end' do
    session[:user_id] = nil
    redirect '/'
  end

  post '/booking/new/' do
    @space = Space.get(params[:space_id])
    erb :newbooking
  end

  post '/booking/create' do
    @booking = Booking.create(booker_id: current_user.id,
                              space_id: params[:space_id],
                              date: "22/04/16",
                              confirmed: false)
    if @booking.save
      redirect '/booking/confirmation'
    else
      p "unsuccessful"
    end
  end

  get '/booking/confirmation' do
    erb :bookingconfirmation
  end

  run! if app_file == $0
end
