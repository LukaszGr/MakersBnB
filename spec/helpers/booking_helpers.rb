module BookingHelper

  def create_booking
    Booking.create(space_id: 1,
      booker_id: 1,
      date: '22/04/16',
      confirmed: false)
  end
end
