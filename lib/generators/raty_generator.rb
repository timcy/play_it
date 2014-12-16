class RatyGenerator < Rails::Generators::Base
  desc "This generator creates an initializer file at config/initializers"
  source_root File.expand_path("../templates", __FILE__)
  def create_initializer_file
  	copy_file "jquery.raty.js", "app/assets/javascripts/jquery.raty.js"
  end
end