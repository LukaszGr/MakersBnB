feature 'book a space' do

  before(:each) do
    create_user
    create_space
  end

  scenario 'book a space for one night' do
    visit '/'
    click_button('Make Booking')
    expect(page).to have_content('Book YoMama')
    expect(page).to have_content("a really dirty house")
    expect(page).to have_content(20)
    click_button('Make Booking')
		expect(page.status_code).to eq(200)
  end

  scenario 'can\'t book a space on a date that\'s already been booked' do
    create_confirmed_booking
    visit '/'
    click_button('Make Booking')
    fill_in('date_rental', :with => '2016/09/02')
    expect{ click_button(:'Make Booking') }.to change{ Space.all.count }.by(0)
  end

  scenario 'book a space can\'t book a space unless signed-in' do
      visit '/'
      find_button('Make Booking')
      click_button('Sign Out')
      expect(page).to_not have_content('Logged in as:')
      find_button('Sign In to Book').click
      sign_in
      expect(page).to have_content('Logged in as:')
      find_button('Make Booking')

    end
end