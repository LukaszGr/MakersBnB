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
    Booking.email_booking_request(@booking.space_id)
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
    Booking.run_confirmation_process(params[:booking_id])
    erb :'bookings/confirmed'
  end

end
