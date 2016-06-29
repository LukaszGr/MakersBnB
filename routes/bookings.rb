class App < Sinatra::Base

post '/booking/new/' do
  @space = Space.get(params[:space_id])
  erb :'bookings/new'
end

post '/booking/create' do
  @booking = Booking.create(booker_id: current_user.id,
                            space_id: params[:space_id],
                            date: params[:date_rental],
                            confirmed: false)
  if @booking.save
    redirect '/booking/confirmation'
  else
    p "unsuccessful"
  end
end

get '/booking/confirmation' do
  erb :'bookings/confirmation'
end

end
