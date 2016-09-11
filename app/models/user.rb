class User < ActiveRecord::Base
	has_secure_password
	
	has_many :friends

  validates :first_name, 
  				:last_name, 
  				:email, 
  				:phone_number,presence: true
  				:password_digest, presence: true

  
  validates :email, uniqueness: true
end