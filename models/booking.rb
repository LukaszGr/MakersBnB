require 'data_mapper'
require_relative 'space'

class Booking

  include DataMapper::Resource

  attr_reader :name, :booker_id

  property :id, Serial
  property :booker_id, Integer
  property :space_id, Integer
  property :confirmed, String
  property :date, String


	belongs_to :space, key => true

	def self.confirmed_booking_dates (space_id)
			confirmed = Booking.all(:confirmed => 'confirmed')
			current_space = confirmed.all(:space_id => space_id)
	    unavailable_dates = current_space.each {|item| item}.map {|key, value| key.date}
	end

  def self.are_dates_unconfirmed?(space_id)
      confirmed_booking_dates(space_id).count < Space.number_of_days(space_id)
  end

  def self.retrieve_bookings_for_space(space_id)
    if booking_exists?(space_id)
      bookings = Hash.new
      space_bookings = Booking.all(space_id: space_id)
      processing_bookings = space_bookings.all(confirmed: 'processing')
      processing_bookings.each do |booking|
        bookings[get_user_who_booked(booking.booker_id)] = booking
      end
      bookings
   else
     nil
   end
  end

  def self.run_confirmation_process(booker_id)
    confirmed_booking = Booking.get(booker_id)
    confirm_booking(confirmed_booking)
    deny_other_bookings(confirmed_booking)
  end

  def self.get_user_who_booked(booker_id)
    User.get(booker_id)
  end

private

  def self.booking_exists?(space_id)
    Booking.count(space_id: space_id) >= 1
  end

  def self.confirm_booking(confirmed_booking)
    confirmed_booking.update(:confirmed => "confirmed")
  end

  def self.deny_other_bookings(confirmed_booking)
    bookings_for_space = Booking.all(:space_id => confirmed_booking.space_id)
    bookings_for_space_and_date = bookings_for_space.all(:date => confirmed_booking.date)
    bookings_to_deny = bookings_for_space_and_date.all(:confirmed => 'processing')
    bookings_to_deny.update(:confirmed => 'denied')
  end

end
