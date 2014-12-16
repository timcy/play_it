module ActiveRecord
	module Acts
		module Rater
			def self.include(base)
				base.extend(ClassMethods)
			end

			module ClassMethods
				def act_as_voter(options={})
					
				end
			end

		end
	end
end