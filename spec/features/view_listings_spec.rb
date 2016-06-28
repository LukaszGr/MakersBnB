
feature 'view listings' do

  before(:each) do
    create_user
    create_space
  end

  scenario 'view all listings' do
    visit '/'
    p Space.all
		expect(page).to have_css("#current_space_list", :text => "YoMama")
  end
end
