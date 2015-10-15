require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_assigns_attributes_correctly
    skill = Skill.new({ "title"         => "a title",
                        "description"   => "a description",
                        "id"            => 1 })

    skill_2 = Skill.new({ "title"       => "2 Title",
                          "description" => "Another Description",
                          "id"          => 1 })

    assert_equal "a title", skill.title
    assert_equal "a description", skill.description
    assert_equal 1, skill.id

    assert_equal "2 Title", skill_2.title
    assert_equal "Another Description", skill_2.description
    assert_equal 2, skill_2.id
  end

  def test_assigns_attributes_correctly
    skill = Skill.new({ "title"       => "a title",
                        "description" => "a description",
                        "id"          => 1 })



    assert_equal "a title", skill.title
    assert_equal "a description", skill.description
    assert_equal 1, skill.id
  end
end
