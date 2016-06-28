module SpaceHelper

  def create_space
    visit '/space/new'
		fill_in 'name', with: 'YoMama House'
		fill_in 'description', with: 'a really dirty house'
		fill_in 'price_per_night', with: '20.00'
    click_button('Add Space')
  end
end
