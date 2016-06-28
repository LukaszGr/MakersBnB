
feature 'view listings' do

  before(:each) do
    create_user
    create_space
    create_space
  end

  scenario 'view all listings' do
    visit '/'
		expect(page).to have_content("YoMama")
  end
end
