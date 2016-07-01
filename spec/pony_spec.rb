describe Pony do
  before(:each) do
    allow(Pony).to receive(:deliver)
  end


  it "sends mail" do
    expect(Pony).to receive(:deliver) do |mail|
      expect(mail.to).to eq [ 'joe@example.com' ]
      expect(mail.from).to eq [ 'sender@example.com' ]
      expect(mail.subject).to eq 'hi'
      expect(mail.body).to eq 'Hello, Joe.'
    end
    Pony.mail(:to => 'joe@example.com', :from => 'sender@example.com', :subject => 'hi', :body => 'Hello, Joe.')
  end

end
