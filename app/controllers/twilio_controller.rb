class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def send_birthday_text

    # credentials - hide later
    account_sid = 'ACcd3fbbc32f31e6d2c425367a4db03155' 
    auth_token = 'cff4a836142add66aaaa0b31db06a8b2' 
    twilio_phone_number = "16264273517" # ENV['TWILIO_NUMBER']

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token  #ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
     
    @client.account.messages.create({
      :from => twilio_phone_number, 
      :to => '6262785522', # for testing, will be friend.phone_number
      :body => 'Happy birthday!', # add friend.first_n
      :media_url => 'https://raw.githubusercontent.com/sf-learners-hackathon-2016/hackathon-app/master/app/assets/images/birthdaycard.png', # point to HBD card
    })

  end


end
