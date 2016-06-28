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

end
