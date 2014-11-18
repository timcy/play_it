class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauth_providers => [:facebook]
   belongs_to :player 
   before_save :generate_token

   def generate_token
   	 self.access_token = SecureRandom.hex
   end
   def self.from_omniauth(auth)
  		where(:email => auth.info.email).first_or_create do |user|
    		player=Player.create(:first_name => auth.info.fist_name,:last_name=>auth.info.last_name,:gender=>auth.info.gender)
        user.email     = auth.info.email
        user.provider  = auth.provider
        user.uid       = auth.uid
        user.player    = player
    		user.save
         
    		
  		end
   end   

end
