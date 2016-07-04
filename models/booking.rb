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

  def self.run_confirmation_process(booking_id)
    confirmed_booking = Booking.get(booking_id)
    p confirmed_booking
    confirm_booking(confirmed_booking)
    deny_other_bookings(confirmed_booking)
    email_booking_confirmed(booking_id,confirmed_booking)
  end

  def self.get_user_who_booked(booker_id)
    User.get(booker_id)
  end

  def self.email_booking_request(space_id)

    space = Space.get(space_id)
    user = User.get(space.user_id)
    Pony.mail(to: user.email, subject: "Booking request - #{space.name}")
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
    email_booking_denied(bookings_to_deny)
  end

  def self.email_booking_confirmed(booking_id,booking)
    booking = Booking.get(booking_id)
    user = User.get(booking.booker_id)
    space = Space.get(booking.space_id)
    Pony.mail(:to => user.email, :subject => "Your booking for #{space.name} on #{booking.date} has been confirmed!")
  end

  def self.email_booking_denied(bookings)
    bookings.each do |booking|
    user = User.get(booking.booker_id)
    space = Space.get(booking.space_id)
    Pony.mail(:to => user.email, :subject => "Your booking for #{space.name} on #{booking.date} has been rejected")
  end
  end

end
