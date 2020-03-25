require 'minitest/autorun'
require_relative 'grader'

class GraderTest < Minitest::Test
  # A = 91~100
  # B = 81~90
  # C = 71~80
  # D = 61~70
  # F = 0~60

  def test_100_points_grade_A
    assert_equal "A", Grader.call(100)
  end

  def test_91_points_grade_A
    assert_equal "A", Grader.call(91)
  end

  def test_90_points_grade_B
    assert_equal "B", Grader.call(90)
  end

  def test_81_points_grade_B
    assert_equal "B", Grader.call(81)
  end

  def test_80_points_grade_C
    assert_equal "C", Grader.call(80)
  end

  def test_71_points_grade_C
    assert_equal "C", Grader.call(71)
  end

  def test_70_points_grade_D
    assert_equal "D", Grader.call(70)
  end

  def test_61_points_grade_D
    assert_equal "D", Grader.call(61)
  end

  def test_60_points_grade_F
    assert_equal "F", Grader.call(60)
  end

  def test_50_points_grade_F
    assert_equal "F", Grader.call(50)
  end

  def test_0_points_grade_F
    assert_equal "F", Grader.call(0)
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
end
