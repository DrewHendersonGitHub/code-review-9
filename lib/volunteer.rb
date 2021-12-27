

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
      volunteers.push(Volunteer.new(name: volunteer.fetch("name"), project_id: volunteer.fetch("project_id").to_i, id: volunteer.fetch("id").to_i))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

end