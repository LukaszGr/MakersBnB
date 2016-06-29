class App < Sinatra::Base
  get '/' do
    @all_spaces = Space.all
    erb :index
  end
end
