

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
  

end