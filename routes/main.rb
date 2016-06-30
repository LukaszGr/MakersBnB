class App < Sinatra::Base
  get '/' do
    @all_available_spaces = Space.array_of_spaces_with_availability(current_user)
    erb :index
  end
end
