require 'bundler/setup'
Bundler.require(:default)

require 'sinatra'
require 'sinatra/activerecord'

Dir[File.join(__dir__, '../app/models/*.rb')].each do |f|
  puts "Requiriendo #{f}"
  require f
end
ActiveRecord::Base.establish_connection(
  YAML.load_file('config/database.yml')[ENV['RACK_ENV'] || 'development']
)
