require 'data_mapper'

class Booking

  include DataMapper::Resource

  attr_reader :name, :booker_id

  property :id, Serial
  property :booker_id, Integer
  property :space_id, Integer
  property :confirmed, String
  property :date, String


	belongs_to :space, key => true

  def self.retrieve_bookings_for_space(space_id)

    if booking_exists?(space_id)
    bookings = Hash.new
    space_bookings = Booking.all(space_id: space_id)
    space_bookings.each do |booking|
      bookings[get_user_who_booked(booking.booker_id)] = booking
    end
    bookings
   else
     nil
   end
  end

  def self.get_user_who_booked(booker_id)
    User.get(booker_id)
  end

private

  def self.booking_exists?(space_id)
    Booking.count(space_id: space_id) >= 1
  end

end
