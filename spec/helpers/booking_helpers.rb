module BookingHelper

  def create_booking
    visit '/'
    click_button('Make Booking')
    click_button('Make Booking')
  end
end
