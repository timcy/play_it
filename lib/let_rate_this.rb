require "let_rate_this/version"
require "let_rate_this/active_record/acts/rater"
require "let_rate_this/active_record/acts/ratable"

module LetRateThis
  begin 
  	require 'rails'

  	class Railtie < Rails::Railtie
  	end

  rescue LoadError
	ActiveRecord::Base.send(:include, ActiveRecord::Acts::Rater) if defined?(ActiveRecord)
  end
end
