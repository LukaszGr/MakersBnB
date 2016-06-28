feature 'Adding space lisiting' do

	scenario 'I can add space listing' do
		sign_in
		visit '/space/new'
		fill_in 'name', with: 'YoMama House'
		fill_in 'description', with: 'a really dirty house'
		fill_in 'price_per_night', with: '20.00'
		fill_in 'date_from', with: '12072016'
		fill_in 'date_to', with: '12082016'


    expect{ click_button(:'Add New Space') }.to change{ Space.all.count }.by(1)
		expect(page.status_code).to eq(200)
		expect(current_path).to eq '/space'
		within 'ul.spaces' do
			expect(page).to have_content 'YoMama House'
		end


	end
end
