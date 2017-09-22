class Volunteer
  attr_reader(:name, :project_id, :id)
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

 #  def save()
 #    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
 #    @id = result.first().fetch("id").to_i()
 #  end
 #
  def ==(another_object)
 self.name().==(another_object.name).&(self.id().==(another_object.id())).&(self.project_id().==another_object.project_id())
  end

  def self.all()
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    list_of_volunteers = []
    returned_volunteers.each() do |single_volunteer|
      name = single_volunteer.fetch("name")
      project_id = single_volunteer.fetch("project_id")
      id = single_volunteer.fetch("id").to_i
      the_volunteer = Project.new({:name => name, :id => id, :project_id => project_id})
      list_of_volunteers.push(the_volunteer)
    end
    list_of_volunteers
  end
 #
 #  def self.find(project_id_to_find)
 #    found_project = nil
 #    Project.all().each do |single_project|
 #      if single_project.id().==(project_id_to_find)
 #         found_project = single_project
 #      end
 #    end
 #    found_project
 #  end
 #










end
