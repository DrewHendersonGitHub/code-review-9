

class Project
  attr_accessor :id, :name

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
  end
  
  def ==(compared)
    self.name == compared.name
  end

end