require_relative '../test_helper'
require 'tilt/erb'

class ViewTest < FeatureTest

  def test_user_sees_correct_page_skills
    visit '/'
      # save_and_open_page # launchy gem opens test in browser
    click_link("Skill Index")
    assert_equal '/skills', current_path
  end

  def test_user_sees_correct_page_new
    visit '/'
      # save_and_open_page # launchy gem opens test in browser
    click_link("New Skill")
    assert_equal '/skills/new', current_path
  end

end

# within("#greeting") do
#   assert page.has_content?("Welcome to the Task Manager")
# end

# fill_in("task[description]", with: "The description of the task.")
# click_link(identifier)
# click_button(identifier)
# assert_equal '/', current_path
