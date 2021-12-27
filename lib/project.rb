

class Project
  attr_accessor :id, :name

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
  end
  
  def ==(compared)
    self.name == compared.name
  end

  def self.all
    projects = []
    returns = DB.exec("SELECT * FROM projects;")
    returns.each do |project|
      projects.push(Project.new({name: project.fetch("name"), id: project.fetch("id").to_i}))
    end
    projects
  end

  
end