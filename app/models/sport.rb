class Sport < ActiveRecord::Base
	belongs_to :player
	# self.inheritance_column = nil
end
