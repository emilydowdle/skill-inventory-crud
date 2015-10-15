require_relative '../test_helper'
require 'tilt/erb'

class AllSkillsListTest < FeatureTest

  def test_find_functionality_works

    SkillInventory.create({ title: "New Skill", description: "New Skill Description"})

    visit '/skills/1'
    # save_and_open_page # launchy gem opens test in browser
    assert_equal '/skills/1', current_path
    assert page.has_content?("New Skill")
    assert page.has_content?("New Skill Description")
    assert page.has_content?("Skill Inventory")

  end

end
