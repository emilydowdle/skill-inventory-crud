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

    skill = SkillInventory.find(1)

    assert_equal 1, skill.id
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

    SkillInventory.delete(1)

    updated_skills = SkillInventory.all

    assert_equal 1, updated_skills.count
  end

  def test_edit_task
    create(1)

    assert_equal "Skill #1", SkillInventory.find(1).title

    SkillInventory.update(1, { :title => "Title",
                               :description => "Description" } )

    assert_equal 1, SkillInventory.all.count
    assert_equal "Title", SkillInventory.find(1).title
    assert_equal "Description", SkillInventory.find(1).description
  end

end
