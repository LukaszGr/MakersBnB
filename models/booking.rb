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
    if Booking.count(space_id: space_id) >= 1
         Booking.all(space_id: space_id)
    else
      return nil
    end
  end
end
