require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require 'pry'
require "pg"

#DB = PG.connect({ dbname: 'volunteer_tracker_test', host: 'db', user: 'postgres', password: 'password' })

get '/' do
  "This is connected to the database ."
end
