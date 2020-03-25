class Grader
  def self.call(score)
    raise ArgumentError, "Non integer score" unless score.kind_of?(Integer)

    scores = [101, 91, 81, 71, 61, 0] << score

    grade = "xABCDFx"[scores.sort.reverse.find_index(score)]

    raise ArgumentError, "Out of bounds" if grade == "x"

    grade
  end

  def self.call_with_case(score)
    raise ArgumentError, "Non integer score" unless score.kind_of?(Integer)

    case score
    when 91..100
      "A"
    when 81..90
      "B"
    when 71..80
      "C"
    when 61..70
      "D"
    when 0..60
      "F"
    else
      raise ArgumentError, "Out of bounds"
    end
  end
end
