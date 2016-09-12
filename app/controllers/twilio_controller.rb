class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def send_birthday_text

    # credentials - hide later
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_phone_number =  ENV['TWILIO_NUMBER']

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token  #ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
     
    @client.account.messages.create({
      :from => twilio_phone_number, 
      :to => '6262785522', # for testing, will be friend.phone_number
      :body => 'Happy birthday!', # add friend.first_n
      :media_url => 'https://raw.githubusercontent.com/sf-learners-hackathon-2016/hackathon-app/master/app/assets/images/birthdaycard.png', # point to HBD card
    })

  end

  def message 
    number = params['From']
    body = params['Body']

    content_type 'text/xml'

    "<Response>
      <Message>
        Hey! I'm just a Birthday Bot! Why don't you text #{user.first_name} 
        here #{user.phone_number} and let them know how 
      </Message>
    </Response>"
  end



end
