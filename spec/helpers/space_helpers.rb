module SpaceHelper

  def create_space
    visit '/space/new'
		fill_in 'name', with: 'YoMama House'
		fill_in 'description', with: 'a really dirty house'
		fill_in 'price_per_night', with: '20.00'
    fill_in 'date_from', with: '01/08/2016'
    fill_in 'date_to', with: '01/10/2016'
    click_button('Add New Space')
  end

  def book_space
    # create space must be run before this
    visit '/'
    click_button('Make Booking')
    click_button('Make Booking')
  end

end
