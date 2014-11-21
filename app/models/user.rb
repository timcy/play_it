class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   belongs_to :player 
   has_many :api_requests
   before_save :generate_token

   def generate_token
   	 self.access_token = SecureRandom.hex
   end     

end
