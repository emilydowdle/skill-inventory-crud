require_relative '../test_helper'
require 'tilt/erb'

class EditSkillTest < FeatureTest

  def test_form_registers_inputs_edited_page
    SkillInventory.create({ title: "New Skill", description: "New Skill Description"})

    visit '/skills'
    # save_and_open_page # launchy gem opens test in browser
    click_link "Edit"

    skill_id = SkillInventory.all.first.id

    assert_equal "/skills/#{skill_id}/edit", current_path

    fill_in 'skill[title]', with: "Edited Skill"

    click_button("Submit")

    assert_equal '/skills', current_path
    assert page.has_content?("Edited Skill")
  end

end
