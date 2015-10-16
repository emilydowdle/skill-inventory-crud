require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test

  def create(num)
    num.times do |i|
      SkillInventory.create({ :title => "Skill ##{i + 1}",
                              :description => "Skill description ##{i + 1}" })
    end
  end

  def test_find_skill_by_id
    create(1)
    skill = SkillInventory.find(SkillInventory.all.first.id)
    # binding.pry
    assert_equal SkillInventory.all.first.id, skill.id
    assert_equal "Skill #1", skill.title
  end

  def test_display_all_skills
    create(2)

    skills = SkillInventory.all

    assert_equal 2, skills.count
  end

  def test_delete_specific_skill
    create(2)

    skills = SkillInventory.all

    assert_equal 2, skills.count

    SkillInventory.delete(SkillInventory.all.first.id)

    updated_skills = SkillInventory.all

    assert_equal 1, updated_skills.count
  end

  def test_edit_task
    create(1)

    assert_equal "Skill #1", SkillInventory.find(SkillInventory.all.first.id).title

    SkillInventory.update(SkillInventory.all.first.id, { :title => "Title",
                               :description => "Description" } )

    assert_equal 1, SkillInventory.all.count
    assert_equal "Title", SkillInventory.find(SkillInventory.all.first.id).title
    assert_equal "Description", SkillInventory.find(SkillInventory.all.first.id).description
  end

end
