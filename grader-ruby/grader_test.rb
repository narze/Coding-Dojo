require 'minitest/autorun'
require_relative 'grader'

class GraderTest < Minitest::Test
  # A = 91~100
  # B = 81~90
  # C = 71~80
  # D = 61~70
  # F = 0~60

  CASES = {
    100 => "A",
    91 => "A",
    90 => "B",
    81 => "B",
    80 => "C",
    71 => "C",
    70 => "D",
    61 => "D",
    60 => "F",
    0 => "F",
  }

  CASES.each do |(point, grade)|
    define_method "test_#{point}_points_grade_#{grade}" do
      assert_equal grade, Grader.call(point.to_i)
    end
  end

  def test_101_points_invalid
    assert_raises(ArgumentError) do
      Grader.call(101)
    end
  end

  def test_minus_points_invalid
    assert_raises(ArgumentError) do
      Grader.call(-1)
    end
  end

  def test_float_points_invalid
    assert_raises(ArgumentError) do
      Grader.call(55.55)
    end
  end

  def test_string_points_invalid
    assert_raises(ArgumentError) do
      Grader.call("99")
    end
  end
end
