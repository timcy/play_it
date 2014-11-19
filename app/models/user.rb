class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauth_providers => [:facebook,:google_oauth2]
   belongs_to :player 
   before_save :generate_token
    mailkick_user

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
    		user.save!
         
    		
  		end
   end   


   def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        player=Player.create(:first_name => data["first_name"],:last_name=>data["last_name"])        
        user = User.create(
          provider:access_token.provider,
          email: data["email"],
          player: player,
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20]
        )
      end
   end
end


   def self.for_twitter(auth)

    
    # user=User.find_by_email(auth.info.email)
    # if user.nil?
    #   player=Player.create(:first_name => auth.info.fist_name,:last_name=>auth.info.last_name,:gender=>auth.info.gender)
    #     user.email     = auth.info.email
    #     user.provider  = auth.provider
    #     user.uid       = auth.uid
    #     user.player    = player
    #     user.save!
    # else
    #   return user
    # end
   end

end
