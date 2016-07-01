require 'data_mapper'
require 'bcrypt'
require 'pony'

class User

  include DataMapper::Resource

  attr_accessor :password, :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of :email

  property :id, Serial
  property :name, String
  property :email, String, format: :email_address, required: true
  property :password_digest, String, length: 60

  has n, :spaces

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate (email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def self.send_welcome_email(user)
    Pony.mail(:to => user.email, :subject => "Welcome to Makers BnB :)", :body => "Hi #{user.name}, \n Thanks for signing up!" )
  end



end
