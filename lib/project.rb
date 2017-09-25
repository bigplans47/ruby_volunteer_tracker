class Project
  attr_reader(:id, :title)
  def initialize(attributes)
    @id = attributes.fetch(:id)
    @title = attributes.fetch(:title)
  end

  def save()
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_object)
 self.title().==(another_object.title).&(self.id().==(another_object.id()))
  end

  def self.all()
    returned_projects = DB.exec("SELECT * FROM projects;")
    list_of_projects = []
    returned_projects.each() do |single_project|
      id = single_project.fetch("id").to_i
      title = single_project.fetch("title")
      # id = single_project.fetch("id").to_i
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


  def volunteers
    # preresult =  DB.exec("SELECT * FROM volunteers;")
    @id = self.id
    project_volunteers = []
    result = DB.exec("SELECT * FROM volunteers WHERE project_id = #{@id};")
    result.each do |single_volunteer2|
      name = single_volunteer2.fetch("name")
      project_id = single_volunteer2.fetch("project_id").to_i
      id = single_volunteer2.fetch("id").to_i
      single_volunteer3 = Volunteer.new({:name => name, :project_id => project_id, :id => id})
      project_volunteers.push(single_volunteer3)
    end
    project_volunteers
  end


  def update(attributes)
    @id = self.id
    @title = attributes.fetch(:title)
    result = DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    @id = self.id
    result = DB.exec("DELETE FROM projects WHERE id = #{@id};")
  end







end
