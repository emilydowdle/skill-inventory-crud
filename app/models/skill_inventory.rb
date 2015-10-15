# Users should be able to enter a skill (create),
# see a list of all of the skills, see each skill
# individually (read), edit a skill (update), and
# delete a skill (delete)

require 'yaml/store'

class SkillInventory
  def self.database
    if ENV["RACK_ENV"] == 'test'
      @database ||= YAML::Store.new("db/skill_inventory_test")
    else
      @database ||= YAML::Store.new("db/skill_inventory")
    end
  end

  def self.delete_all
    database.transaction do
      database['skills'] = []
      database['total'] = 0
    end
  end

  def self.create(skill)
    database.transaction do
      database['skills'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['skills'] << { "id" => database['total'], "title" => skill[:title], "description" => skill[:description] }
    end
  end

  def self.update(id, data)
    database.transaction do
      target = database['skills'].find { |skill| skill["id"] == id }
      target["title"] = data[:title]
      target["description"] = data[:description]
    end
  end

  def self.delete(id)
    database.transaction do
      database['skills'].delete_if { |skill| skill["id"] == id }
    end
  end

  def self.raw_skills
    # raw_skills.find { |skill | skill["id"] == id }
    database.transaction do
      database['skills'] || []
    end
  end

  def self.all
    raw_skills.map { |data| Skill.new(data) }
  end

  def self.raw_skill(id)
    raw_skills.find { |skill| skill["id"] == id }
  end

  def self.find(id)
    Skill.new(raw_skill(id))
  end
end
