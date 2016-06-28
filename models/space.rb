require 'data_mapper'

class Space

  include DataMapper::Resource

  attr_reader :name

  property :id, Serial
  property :name, String, :required => true
  property :description, String, :required => true
  property :price_per_night, Decimal, :required => true, precision: 6, scale: 2

	belongs_to :user
  has n, :bookings

end
