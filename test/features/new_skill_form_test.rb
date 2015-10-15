require_relative '../test_helper'
require 'tilt/erb'

class NewSkillTest < FeatureTest

  def test_form_registers_inputs_new
    visit '/skills/new'
      # save_and_open_page # launchy gem opens test in browser
    assert_equal '/skills/new', current_path

    fill_in 'skill[title]', with: "New Skill"
    fill_in 'skill[description]', with: "I have a new skill!"

    click_button("Submit")

    assert_equal '/skills', current_path
    assert page.has_content?("New Skill")
  end

end
