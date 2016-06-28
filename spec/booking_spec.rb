describe Booking do

  scenario 'sucessful booking created' do
    create_user
    create_space
    visit('/')
    expect{create_booking}.to change{Booking.count}.by 1
  end

end
