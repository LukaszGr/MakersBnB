module BookingHelper

  def create_booking
    visit '/'
    click_button('Make Booking')
    click_button('Make Booking')
  end

  def create_confirmed_booking(booker_id: 1, space_id: 1, date_rental: '2016/09/02')
    booking = Booking.create(booker_id: booker_id,
                            space_id: space_id,
                            date: date_rental,
                            confirmed: true)
    booking.save
  end
end
