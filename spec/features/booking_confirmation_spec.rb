feature 'booking confirmation' do

  before :each do
    create_user
    create_space
  end

  scenario 'button on front end to view booking requests' do

    click_button('Sign Out')
    create_user(name: 'Jeff', email: 'jeff@jeff.com', password: 'abcd', password_confirmation: 'abcd')
    book_space
    click_button('Sign Out')
    sign_in
    click_button('View booking requests')
  end

  scenario 'view all booking requests' do

    click_button('Sign Out')
    create_user(name: 'Vader', email: 'vader@jeff.com', password: 'star', password_confirmation: 'star')
    book_space
    click_button('Sign Out')
    sign_in
    click_button('View booking requests')
    expect(page).to have_content("YoMama")
    expect(page).to have_content("Vader")
      click_button('Confirm Booking')
      expect(page).to have_content('Booking confirmed. Yay!')
  end
end
