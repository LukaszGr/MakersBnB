require 'data_mapper'
require_relative 'booking'

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
    bookings = Hash.new
    if user_has_space?(user_id)
      retrieve_all_users_spaces(user_id).each do |space|
        bookings[space] = Booking.retrieve_bookings_for_space(space.id)
      end
    else
      return false
    end
    do_any_bookings_exist_for_spaces?(bookings) ? bookings : false
  end

  def self.array_of_spaces_with_availability(current_user)
    all_spaces = Space.all
    spaces_with_availability = []
    all_spaces.each { |space| Booking.are_dates_unconfirmed?(space.id) ? spaces_with_availability << space : nil }
    return spaces_with_availability.select do |space|
      space.user_id != current_user
    end
  end

  def self.number_of_days(space_id)
    space = Space.get(space_id)
    ((space.date_to - space.date_from) + 1)
  end

  def self.email_confirm_listing(space,current_user)
    Pony.mail(:to => current_user.email, :subject => "#{space.name} has been listed")
  end


  private


  def self.user_has_space?(user_id)
    Space.count(user_id: user_id) >= 1
  end

  def self.retrieve_all_users_spaces(user_id)
    Space.all(user_id: user_id)
  end

  def self.do_any_bookings_exist_for_spaces?(bookings)
    !(bookings.all? {|name,bookings| bookings == nil})
  end
end
