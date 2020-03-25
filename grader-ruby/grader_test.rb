require 'minitest/autorun'
require_relative 'grader'

class GraderTest < Minitest::Test
  def test_100_points_grade
    assert_equal "A", Grader.call(100)
  end
end
