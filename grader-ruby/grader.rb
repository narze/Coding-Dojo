class Grader
  def self.call(score)
    case
    when score > 100
      raise ArgumentError, "Out of bounds"
    when score > 90
      "A"
    when score > 80
      "B"
    when score > 70
      "C"
    when score > 60
      "D"
    when score >= 0
      "F"
    else
      raise ArgumentError, "Out of bounds"
    end
  end
end
