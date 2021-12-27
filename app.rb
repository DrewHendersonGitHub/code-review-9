require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/project'
require './lib/volunteer'
require 'pry'
require "pg"

DB = PG.connect({ dbname: 'volunteer_tracker', host: 'db', user: 'postgres', password: 'password' })

get '/' do
  @projects = Project.all

  erb(:projects)
end

get '/projects' do
  @projects = Project.all

  erb(:projects)
end

post '/projects' do
  project = Project.new({name: params[:name]})
  project.save
  @projects = Project.all
  erb(:projects)
end

get '/projects/:id' do
  @project = Project.find(params[:id].to_i)
  @all_volunteers = Volunteer.all
  @volunteers = @project.volunteers
  erb(:project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  name = params[:name]
  @project.update({name: name})
  @volunteers = Volunteer.all
  erb(:project)
end

post '/projects/:id' do
  volunteer = Volunteer.new({name: params[:title], project_id: params[:projectid]})
  volunteer.save
  @project = Project.find(params[:id].to_i)
  @all_volunteers = Volunteer.all
  @volunteers = @project.volunteers 
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  @all_volunteers = Volunteer.all
  @volunteers = @project.volunteers
  erb(:project)
end