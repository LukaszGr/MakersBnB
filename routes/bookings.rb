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
    Booking.run_confirmation_process(params[:booking_id])
    # booking = Booking.get(params[:booking_id])
    # booking.update(:confirmed => "confirmed")
    # bookings_for_space = Booking.all(:space_id => booking.space_id)
    # bookings_for_space_and_date = bookings_for_space.all(:date => booking.date)
    # bookings_to_deny = bookings_for_space_and_date.all(:confirmed => 'processing')
    # bookings_to_deny.update(:confirmed => 'denied')
    erb :'bookings/confirmed'
  end

end
