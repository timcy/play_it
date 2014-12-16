class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   belongs_to :player 
   has_many :api_requests
   has_many :tasks
   before_save :generate_token
   has_many :photos, :as => :attachable
   has_one :avatar, :class_name => 'Photo', :as => :attachable
   accepts_nested_attributes_for :photos, allow_destroy: true
   
   def generate_token
   	 self.access_token = SecureRandom.hex
   end     

end
