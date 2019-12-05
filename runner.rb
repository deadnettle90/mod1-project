require_relative 'config/environment'
ActiveRecord::Base.logger = nil

cli = Cli.new
cli.welcome
cli.store_city



# binding.pry
# 0