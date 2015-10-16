require_relative '../test_helper'
require 'tilt/erb'

class AllSkillsListTest < FeatureTest

  def test_find_functionality_works
    SkillInventory.create({ title: "New Skill", description: "New Skill Description"})

    skill_id = SkillInventory.all.first.id

    visit "/skills/#{skill_id}"
    # save_and_open_page # launchy gem opens test in browser
    assert_equal "/skills/#{skill_id}", current_path
    assert page.has_content?("New Skill")
    assert page.has_content?("New Skill Description")
    assert page.has_content?("Skill Inventory")

  end

end
