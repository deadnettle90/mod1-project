require_relative 'config/environment'
# require 'colorize'
# require 'colorized_string'

ActiveRecord::Base.logger = nil

cli = Cli.new
cli.welcome
cli.store_city


# binding.pry
# 0