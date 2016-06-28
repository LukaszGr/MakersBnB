feature 'Adding space listing' do

	scenario 'I can add space listing' do
		create_user
		visit '/space/new'
		fill_in 'name', with: 'YoMama House'
		fill_in 'description', with: 'a really dirty house'
		fill_in 'price_per_night', with: '20.00'
		fill_in 'date_from', with: '12/07/2016'
		fill_in 'date_to', with: '12/08/2016'

		expect{ click_button(:'Add New Space') }.to change{ Space.all.count }.by(1)
		expect(page.status_code).to eq(200)
		expect(current_path).to eq '/'
		expect(page).to have_css("#current_space_list", :text => "YoMama")
	end

	scenario 'error if date_from is later than date_to' do
		create_user
		visit '/space/new'
		fill_in 'name', with: 'YoMama House'
		fill_in 'description', with: 'a really dirty house'
		fill_in 'price_per_night', with: '20.00'
		fill_in 'date_from', with: '12/08/2016'
		fill_in 'date_to', with: '12/07/2016'

		expect{ click_button(:'Add New Space') }.to change{ Space.all.count }.by(0)
		expect(page).to have_content('"date from" cannot be after "date to"')
	end
end
