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

	def self.confirmed_booking_dates (space_id)
			confirmed = Booking.all(:confirmed => true)
			current_space = confirmed.all(:space_id => space_id)
	    unavailable_dates = current_space.each {|item| item}.map {|key, value| key.date}

	  end
end
