class Project
  attr_reader(:title, :id)
  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_object)
 self.title().==(another_object.title).&(self.id().==(another_object.id()))
  end

  def self.all
    []
  end

end
