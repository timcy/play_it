class Player < ActiveRecord::Base
 has_many :sports
 has_one :user
 accepts_nested_attributes_for :user
end
