class Grader
  def self.call(score)
    case
    when score > 90
      "A"
    when score > 80
      "B"
    when score > 70
      "C"
    when score > 60
      "D"
    else
      "F"
    end
  end
end
