
feature 'sign up' do

  scenario 'successful signup' do

    visit '/user/new'
    fill_in('name', :with => 'Joe')
    fill_in('email', :with => 'joebloggs@email.com')
    fill_in('password', :with => '123456')
    fill_in('password_confirmation', :with => '123456')
    click_button('submit')
    expect(page).to have_content('Logged in as: Joe')

  end

  scenario 'Password incorrect should raise error' do

    visit '/user/new'
    fill_in('name', :with => 'Joe')
    fill_in('email', :with => 'joebloggs@email.com')
    fill_in('password', :with => '123456')
    fill_in('password_confirmation', :with => 'jrfijroifjroifjr')
    click_button('submit')
    expect(page).to have_content('Password does not match the confirmation')

  end

end
