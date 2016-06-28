require 'data_mapper'

class Space

  include DataMapper::Resource

  #attr_accessor :password, :password_confirmation

  #validates_confirmation_of :password
  #validates_uniqueness_of :email

  property :id, Serial
  #property :user_id, Integer
  property :name, String, :required => true
  property :description, String, :required => true
  property :price_per_night, Decimal, :required => true, precision: 6, scale: 2

	belongs_to :user
end
