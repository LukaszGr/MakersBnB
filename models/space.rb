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

end
