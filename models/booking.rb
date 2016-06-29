require 'data_mapper'

class Booking

  include DataMapper::Resource

  attr_reader :name

  property :id, Serial
  property :booker_id, Integer
  property :space_id, Integer
  property :confirmed, Boolean
  property :date, String


	belongs_to :space, key => true

  def self.retrieve_bookings_for_space(space_id)
    booking_exists?(space_id) ? Booking.all(space_id: space_id) : nil
  end

private

  def self.booking_exists?(space_id)
    Booking.count(space_id: space_id) >= 1
  end

end
