class App < Sinatra::Base

post '/booking/new/' do
  @space = Space.get(params[:space_id])
  erb :'bookings/new'
end

get '/booking/view' do
  erb :'bookings/confirmation'
end


post '/booking/create' do
  @booking = Booking.create(booker_id: current_user.id,
                            space_id: params[:space_id],
                            date: params[:date_rental],
                            confirmed: :processing)
  if @booking.save
    redirect '/booking/request'
  else
    p "unsuccessful"
  end
end

  get '/booking/request' do
    erb :'bookings/request'
  end

  get '/booking/confirmation' do
    erb :'bookings/confirmation'
  end

  post '/booking/confirmation' do
    booking = Booking.get(params[:booking_id])
    p booking.space_id
    p Booking.get(:space_id => booking.space_id)
    booking.update(:confirmed => "confirmed")
    erb :'bookings/confirmed'
  end

end
