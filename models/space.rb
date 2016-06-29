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
    bookings = []
    if Space.count(user_id: user_id) >= 1
      spaces = Space.all(user_id: user_id)
      spaces.each do |space|
        bookings << Booking.retrieve_bookings_for_space(space.id)
      end
    else
      return false
    end
   (bookings.all? {|booking| booking == nil}) ? false : bookings
  end
end
