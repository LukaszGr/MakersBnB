module UsersHelper

  def create_user(name: "Toby", email: "tobywilkinsuk@hotmail.co.uk", password_confirmation: "supersecret", password: "supersecret")
    visit '/user/new'
    fill_in('name', :with => name)
    fill_in('email', :with => email)
    fill_in('password', :with => password)
    fill_in('password_confirmation', :with => password_confirmation)
    click_button "submit"
  end

  def sign_in(email: "tobywilkinsuk@hotmail.co.uk", password: "supersecret")
    visit "/"
    click_link "Sign In"
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "submit"
  end
end
