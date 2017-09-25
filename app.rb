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
