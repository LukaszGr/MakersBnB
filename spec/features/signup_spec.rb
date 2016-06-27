
feature 'sign up' do

  scenario 'successful signup' do

    visit '/user/new'
    fill_in('name', :with => 'Joe')
    fill_in('email', :with => 'joebloggs@email.com')
    fill_in('password', :with => '123456')
    click_button('submit')
    expect(page).to have_content('Welcome, Joe')

  end

end
