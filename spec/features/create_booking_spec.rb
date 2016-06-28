feature 'book a space' do

  before(:each) do
    create_user
    create_space
  end

  scenario 'book a space for one night' do
    visit '/'
    click_button('Make Booking')
    expect(page).to have_content('Book YoMama')
  end

end
