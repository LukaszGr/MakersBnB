
feature 'log in' do

  before(:each) do
    create_user
  end

  scenario 'successful login' do

    visit '/session/new'
    fill_in('email', :with => "toby@makersacademy.com")
    fill_in('password', :with => "supersecret")
    click_button('submit')
    expect(page).to have_content('Logged in as: Toby')

  end

  scenario 'Password incorrect should raise error' do

    visit '/session/new'
    fill_in('email', :with => "toby@makersacademy.com")
    fill_in('password', :with => "wrongggggggg")
    click_button('submit')
    expect(page).to have_content('This email/password combination does not exist')

  end

  scenario 'Email incorrect should raise error' do

    visit '/session/new'
    fill_in('email', :with => "wrong@makersacademy.com")
    fill_in('password', :with => "supersecret")
    click_button('submit')
    expect(page).to have_content('This email/password combination does not exist')

  end
end
