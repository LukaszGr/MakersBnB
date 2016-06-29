class App < Sinatra::Base

  get '/space/new' do
    erb :'spaces/new'
  end

  post '/space' do
    current_user
    if params[:date_from] > params[:date_to]
      flash.now[:errors] = ['"date from" cannot be after "date to"']
      erb :'spaces/new'
    else
      @space = Space.create(name: params[:name],
                            description: params[:description],
                            price_per_night: params[:price_per_night],
                            date_from: params[:date_from],
                            date_to: params[:date_to],
                            user_id: current_user.id)
      redirect '/'
    end
  end
end
