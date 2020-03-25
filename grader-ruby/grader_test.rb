require 'minitest/autorun'
require_relative 'grader'

class GraderTest < Minitest::Test
  def test_100_points_grade_A
    assert_equal "A", Grader.call(100)
  end

  def test_91_points_grade_A
    assert_equal "A", Grader.call(91)
  end

  def test_90_points_grade_b_
    assert_equal "B", Grader.call(90)
  end
end
