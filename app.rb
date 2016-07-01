ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'pony'

class App < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  register Sinatra::Partial

  set :partial_template_engine, :erb
  enable :partial_underscores

    configure do
  Pony.options = {
    :via => :smtp,
    :via_options => {
      :address => 'smtp.sendgrid.net',
      :port => '587',
      :user_name => ENV['SENDGRID_USERNAME'],
      :password => ENV['SENDGRID_PASSWORD'],
      :authentication => :plain,
      :enable_starttls_auto => true,
      :domain => "makersb-n-b.herokuapp.com"
    }
  }
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def has_bookings
    Space.retrieve_bookings(current_user.id)
    end

    def booking_info
      @booking_info ||= Space.retrieve_bookings(current_user.id)
    end
  end

  require_relative 'models/init'
  require_relative 'routes/init'

  run! if app_file == $0
end
