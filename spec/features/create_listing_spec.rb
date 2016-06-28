feature 'Adding space lisiting' do

	scenario 'I can add space listing' do
		sign_in
		visit '/space/new'
		fill_in 'name', with: 'YoMama House'
		fill_in 'description', with: 'a really dirty house'
		fill_in 'price_per_night', with: '20.00'

		expect{ click_button(:'Add Space') }.to change{ Space.all.count }.by(1)
		expect(page.status_code).to eq(200)
		expect(current_path).to eq '/'
		expect(page).to have_css("#current_space_list", :text => "YoMama")
	end
end
