class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def send_birthday_text

  # credentials - hide later
  account_sid = 'ACcd3fbbc32f31e6d2c425367a4db03155' 
  auth_token = 'cff4a836142add66aaaa0b31db06a8b2' 
  twilio_phone_number = "16264273517"
   
  # set up a client to talk to the Twilio REST API 
  @client = Twilio::REST::Client.new account_sid, auth_token 
   
  @client.account.messages.create({
    :from => twilio_phone_number, 
    :to => '6262785522', 
    :body => 'Happy birthday!', # add friend first name here 
    :media_url => 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg', # point to HBD card
  })

  end


end
