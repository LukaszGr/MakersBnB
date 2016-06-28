
describe User do

  describe '#new' do
    it 'should create a new user if information is correct' do
      expect{create_user}.to change{User.count}.by(1)
    end

    it 'should not create a new user if passwords do not match' do
      expect{create_user(password_confirmation: "wrong")}.not_to change{User.count}
    end

    it 'should not create a new user if no email is provided' do
      expect{create_user(email: nil)}.not_to change{User.count}
    end

    it 'should not create a new user if email has already been registered' do
      create_user
      expect{create_user}.not_to change{User.count}
    end
  end

end
