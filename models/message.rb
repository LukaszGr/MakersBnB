require 'twilio-ruby'

class Message

  def initialize
    @account_sid = 'AC523a45e9dac5d5632587d0287ee72602'
    @auth_token = 'e3c83928fa83c36efd5f66589f4a2e05'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def book_request_send
    @client.account.messages.create({from: "+441361866056", to: "+447533736095", body: "Someone would like to book your space."})
  end

  def space_confirmed_send
    @client.account.messages.create({from: "+441361866056", to: "+447533736095", body: "Yay! Your request for space has been confirmed."})
  end

  def space_denied_send
    @client.account.messages.create({from: "+441361866056", to: "+447533736095", body: "Sadly, you request for space has been denied."})
  end


end