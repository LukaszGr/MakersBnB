
feature 'sign up' do

before(:each) do
  allow(Pony).to receive(:deliver)
end

  scenario 'successful signup' do

    visit '/user/new'
    fill_in('name', :with => 'Toby')
    fill_in('email', :with => 'tobywilkinsuk@hotmail.co.uk')
    fill_in('password', :with => '123456')
    fill_in('password_confirmation', :with => '123456')
    click_button('submit')
    expect(page).to have_content('Logged in as: Toby')

  end

  scenario 'Password incorrect should raise error' do

    visit '/user/new'
    fill_in('name', :with => 'Toby')
    fill_in('email', :with => 'tobywilkinsuk@hotmail.co.uk')
    fill_in('password', :with => '123456')
    fill_in('password_confirmation', :with => 'jrfijroifjroifjr')
    click_button('submit')
    expect(page).to have_content('Password does not match the confirmation')

  end

  scenario 'should send welcome email' do
    visit '/user/new'
    fill_in('name', :with => 'Toby')
    fill_in('email', :with => 'tobywilkinsuk@hotmail.co.uk')
    fill_in('password', :with => '123456')
    fill_in('password_confirmation', :with => '123456')
    click_button('submit')
    expect(page).to have_content('Logged in as: Toby')
    expect(Pony).to have_received(:deliver) do |mail|
      expect(mail.to).to eq [ 'tobywilkinsuk@hotmail.co.uk' ]
    end
  end
end
