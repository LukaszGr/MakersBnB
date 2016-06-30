require 'data_mapper'

class Space

  include DataMapper::Resource

  attr_reader :name

  property :id, Serial
  property :name, String, :required => true
  property :description, String, :required => true
  property :price_per_night, Decimal, :required => true, precision: 6, scale: 2
  property :date_from, Date, :required => true
  property :date_to, Date, :required => true

	belongs_to :user
  has n, :bookings


  def self.retrieve_bookings(user_id)
    bookings = Hash.new
    if user_has_space?(user_id)
      retrieve_all_users_spaces(user_id).each do |space|
        bookings[space] = Booking.retrieve_bookings_for_space(space.id)
      end
    else
      return false
    end
    do_any_bookings_exist_for_spaces?(bookings) ? bookings : false
  end

  private


  def self.user_has_space?(user_id)
    Space.count(user_id: user_id) >= 1
  end

  def self.retrieve_all_users_spaces(user_id)
    Space.all(user_id: user_id)
  end

  def self.do_any_bookings_exist_for_spaces?(bookings)
    !(bookings.all? {|name,bookings| bookings == nil})
  end
end
