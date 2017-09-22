class Project
  attr_reader(:title, :id)
  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def save()
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_object)
 self.title().==(another_object.title).&(self.id().==(another_object.id()))
  end

  def self.all()
    returned_projects = DB.exec("SELECT * FROM projects")
    list_of_projects = []
    returned_projects.each() do |single_project|
      title = single_project.fetch("title")
      id = single_project.fetch("id").to_i
      the_project = Project.new({:title => title, :id => id})
      list_of_projects.push(the_project)
    end
    list_of_projects
  end

  def self.find(project_id_to_find)
    found_project = nil
    Project.all().each do |single_project|
      if single_project.id().==(project_id_to_find)
         found_project = single_project
      end
    end
    found_project
  end











end
