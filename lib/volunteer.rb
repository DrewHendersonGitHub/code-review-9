

class Volunteer
  attr_accessor :id, :name, :project_id

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @project_id = attributes[:project_id]
  end

  def ==(compared)
    self.name == compared.name && self.project_id == compared.project_id
  end

  def self.all
    volunteers = []
    returns = DB.exec("SELECT * FROM volunteers;")
    returns.each do |volunteer|
      volunteers.push(Volunteers.new(name: volunteers.fetch("name"), project_id: volunteers.fetch("project_id"), id: volunteers.fetch("id")))
    end
    volunteers
  end

end