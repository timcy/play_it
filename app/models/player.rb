class Player < ActiveRecord::Base
 has_many :sports
 has_one :user, dependent: :destroy
 accepts_nested_attributes_for :user
end
