class Volunteer
  attr_accessor :id, :name, :project_id

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @project_id = attributes[:project_id]
  end

  def ==(compared)
    if compared != nil
      self.name == compared.name && self.project_id == compared.project_id
    else
      false
    end
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

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    if volunteer
      Volunteer.new(name: volunteer.fetch("name"), project_id: volunteer.fetch("project_id").to_i, id: volunteer.fetch("id").to_i)
    else
      nil
    end
  end

  def update(attributes)
    @project_id = attributes[:project_id]
    DB.exec("UPDATE volunteers SET project_id = #{@project_id} WHERE id = #{@id};")
  end

  def update_name(attributes)
    @name = attributes[:name]
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@id};")
  end

end