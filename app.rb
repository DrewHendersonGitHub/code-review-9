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

patch '/projects/:id' do
  @project = Project.find(params[:id].to_i)
  @project.update({name: params[:title]})
  @volunteers = Volunteer.all
  erb(:project)
end

post '/projects/:id' do
  volunteer = Volunteer.new({name: params[:name], project_id: params[:projectid]})
  volunteer.save
  @project = Project.find(params[:id].to_i)
  @all_volunteers = Volunteer.all
  @volunteers = @project.volunteers 
  erb(:project)
end

get '/projects/:id/edit' do
  @project = Project.find(params[:id].to_i)
  @all_volunteers = Volunteer.all
  @volunteers = @project.volunteers
  erb(:project)
end

delete '/projects/:id' do
  @project = Project.find(params[:id].to_i)
  @project.delete
  redirect to '/projects'
end

get '/volunteer/:id' do
  @volunteer = Volunteer.find(params[:id].to_i)
  @project = Project.find((@volunteer.project_id).to_i)
  erb(:volunteer)
end

patch '/volunteer/:id' do
  @volunteer = Volunteer.find(params[:volunteerid])
  @volunteer.update_name({name: params[:name]})
  @volunteer = Volunteer.find(params[:id].to_i)
  @project = Project.find((@volunteer.project_id).to_i)
  erb(:volunteer)
end