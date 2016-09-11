class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :authy_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_secure_password
	
	has_many :friends

  validates :first_name, 
  				:last_name, 
  				:email, 
  				:phone_number, 
  				:password_digest, presence: true

  			
end