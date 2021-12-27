

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

  def save
    result = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    if project
      Project.new({name: project.fetch("name"), id: project.fetch("id").to_i})
    end
  end

  def volunteers
    volunteers = []
    returns = DB.exec("SELECT * FROM volunteers WHERE project_id = #{@id};")
    returns.each do |volunteer|
      volunteers.push(Volunteer.new({name: volunteer.fetch("name"), project_id: volunteer.fetch("project_id").to_i, id: volunteer.fetch("id").to_i}))
    end
    volunteers
  end

end