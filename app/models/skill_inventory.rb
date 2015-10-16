class SkillInventory
  def self.database
    if ENV["RACK_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
  end

  def self.delete_all
    database.from(:skills).delete
  end

  def self.create(skill)
    table = database.from(:skills)
    table.insert(:title => skill[:title], :description => skill[:description])
  end

  def self.update(id, data)
    table = database.from(:skills)
    table.where(:id => id).update(:title => data[:title], :description => data[:description])
  end

  def self.delete(id)
    table = database.from(:skills)
    table.where(:id => id).delete
  end

  def self.all
    table = database.from(:skills).to_a
    table.map do |data|
      Skill.new(data)
    end
  end

  def self.find(id)
    table = database.from(:skills)
    skill = table.where(:id => id).to_a.first
    Skill.new(skill)
  end
end
