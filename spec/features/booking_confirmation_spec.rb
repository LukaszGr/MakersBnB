feature 'booking confirmation' do


  scenario 'button on front end to view booking requests' do



      visit '/user/new'
      fill_in('name', :with => "Toby")
      fill_in('email', :with => "toby@makersacademy.com")
      fill_in('password', :with => "supersecret")
      fill_in('password_confirmation', :with => "supersecret")
      click_button "submit"
    # create_user

    visit '/space/new'
    fill_in 'name', with: 'YoMama House'
    fill_in 'description', with: 'a really dirty house'
    fill_in 'price_per_night', with: '20.00'
    fill_in 'date_from', with: '01/08/2016'
    fill_in 'date_to', with: '01/10/2016'
    click_button('Add New Space')

    click_button('Sign Out')
    create_user(name: 'Jeff', email: 'jeff@jeff.com', password: 'abcd', password_confirmation: 'abcd')
    book_space
    click_button('Sign Out')
    sign_in
    click_button('View booking requests')
  end
end
