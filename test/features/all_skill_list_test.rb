require_relative '../test_helper'
require 'tilt/erb'

class AllSkillsListTest < FeatureTest

  def test_skills_route_displays_all_skills
    SkillInventory.create({ title: "New Skill", description: "New Skill Description"})

    visit '/skills'
    # save_and_open_page # launchy gem opens test in browser
    assert_equal '/skills', current_path
    assert page.has_content?("New Skill")
  end

end
