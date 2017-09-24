class Volunteer
  attr_reader(:name, :project_id, :id)
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def save()
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
    # binding.pry
  end
 #
  def ==(another_object)
 self.name().==(another_object.name).&(self.id().==(another_object.id())).&(self.project_id().==another_object.project_id())
  end

  def self.all()
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    # binding.pry
    list_of_volunteers = []
    # binding.pry - works ok to here
    returned_volunteers.each() do |single_volunteer|
      id = single_volunteer.fetch("id").to_i
      name = single_volunteer.fetch("name")
      project_id = single_volunteer.fetch("project_id").to_i

      # binding.pry
      the_volunteer = Volunteer.new({:name => name, :id => id, :project_id => project_id})
      list_of_volunteers.push(the_volunteer)
    end
    list_of_volunteers
    # binding.pry
  end

  def self.find(id_to_find)
    found_volunteer = nil
    Volunteer.all().each do |single_volunteer|
      if single_volunteer.id().==(id_to_find)
         found_volunteer = single_volunteer
      end
    end
    found_volunteer
  end




end
