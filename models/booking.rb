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

end
