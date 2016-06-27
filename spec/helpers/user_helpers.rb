module UsersHelper
  def create_user(name: "Toby", email: "toby@makersacademy.com",password_confirmation: "supersecret", password: "supersecret")
    User.create(email: email,
      password: password,
      password_confirmation: password_confirmation,
      name: name)
  end

  def sign_in
    user = create_user(password: "password")
    visit "/"
    click_link "Sign In"
    fill_in :email, with: user.email
    fill_in :password, with: "password"
    click_button "Sign In"
  end
end
