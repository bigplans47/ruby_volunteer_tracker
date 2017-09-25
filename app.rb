require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do
  @project_list = Project.all()
  erb(:index)
end

post('/') do
  project_title = params.fetch("title")
  project = Project.new({:title => project_title, :id => nil})
  project.save
  @project_list = Project.all()
  erb(:index)
end

get('/project/:id') do
  # i need to get the id to find the project
  @id = params.fetch("id").to_i
  @the_project = Project.find(@id)
  erb(:project)
end

get('/project/:id/edit_title') do
  # i need to get the id to find the project
  @id = params.fetch("id").to_i
  @the_project = Project.find(@id)
  erb(:project_edit)
end

post('/project/:id/edit_title') do
  # i need to get the id to find the project
  project_title = params.fetch("title")
  @id = params.fetch("id").to_i
  @the_project = Project.find(@id)
  @the_project.update({:title => project_title})
  erb(:project_edit)
end

get('/project/:id/edit') do
  @id = params.fetch("id").to_i
  @the_project = Project.find(@id)
  erb(:project_delete)
end

post('/project/:id/edit') do
  # i need to get the id to find the project
  @id = params.fetch("id").to_i
  @the_project = Project.find(@id)
  @the_project.delete
  erb(:index)
end

post('/home/:id') do
  @id = params.fetch("id").to_i
  @the_project = Project.find(@id)
  @the_project.delete
  @project_list = Project.all()
  erb(:index)
end
