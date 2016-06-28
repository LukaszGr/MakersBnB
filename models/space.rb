require 'data_mapper'

class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :description, String, :required => true
  property :price_per_night, Decimal, :required => true, precision: 6, scale: 2
  property :date_from, Date
  property :date_to, Date

	belongs_to :user
end
