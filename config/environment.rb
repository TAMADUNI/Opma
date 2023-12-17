# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Rails.logger = Logger.new("log/#{Rails.env}.log")
logger = ActiveSupport::Logger.new("log/#{Rails.env}.log")
Rails.logger.broadcast_to(logger)

