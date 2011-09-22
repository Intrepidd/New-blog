# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
NewBlog::Application.initialize!

#log ActiveRecord
ActiveRecord::Base.logger = Logger.new(STDOUT) if defined? Rails::Console
