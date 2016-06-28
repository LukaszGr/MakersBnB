describe Booking do

  scenario 'sucessful booking created' do
    expect{create_booking}.to change{Booking.count}.by 1
  end

end
