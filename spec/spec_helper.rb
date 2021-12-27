require "volunteer"
require "project"
require "rspec"
require "pry"
require "pg"

DB = PG.connect({ dbname: 'volunteer_tracker_test', host: 'db', user: 'postgres', password: 'password' })

RSpec.configure do |config|
  config.after(:each) do
    
  end
end






#require "volunteer"
#require "project"
#require "rspec"
#require "pry"
#require "pg"
#
#DB = PG.connect({:dbname => 'volunteer_tracker_test'})
#
#RSpec.configure do |config|
#  config.after(:each) do
#    DB.exec('DELETE FROM volunteers *;')
#    DB.exec('DELETE FROM projects *;')
#  end
#end





#require 'rspec'
#require 'pg'
#require 'pry'
#
#DB = PG.connect({ dbname: 'record_store_test', host: 'db', user: 'postgres', password: 'password' })
#
#RSpec.configure do |config|
#  config.after(:each) do
#    # Add code to clear database.
#  end
#end
#