describe Booking do

  before(:each) do
    create_user
    create_space
  end

  scenario 'sucessful booking created' do
    visit('/')
    expect{create_booking}.to change{Booking.count}.by 1
  end

  scenario 'confirmation of booking denies other bookings' do

      click_button('Sign Out')
      create_user(name: 'Vader', email: 'vader@jeff.com', password: 'star', password_confirmation: 'star')
      book_space
      click_button('Sign Out')
      create_user(name: 'Jeff', email: 'jeff@jeff.com', password: 'star', password_confirmation: 'star')
      book_space
      click_button('Sign Out')
      sign_in
      click_button('View booking requests')
      within('form.confirm-0') do
      Booking.all(:confirmed => 'denied').count
      expect{click_button('Confirm Booking')}.to change{Booking.all(:confirmed => 'denied').count}.by 1
      Booking.all(:confirmed => 'denied').count
      end
      expect(page).to have_content('Booking confirmed. Yay!')


  end

end
