require 'bundler/setup'
Bundler.require(:default)

require 'sinatra'
require 'sinatra/activerecord'

Dir[File.join(__dir__, '../app/models/*.rb')].each { |f| require f }

ActiveRecord::Base.establish_connection(
  YAML.load_file('config/database.yml')[ENV['RACK_ENV'] || 'development']
)
