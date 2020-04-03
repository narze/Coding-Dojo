class Tictactoe
  def initialize
    @board = [nil] * 9
  end

  def print
    @board.map { |c| c.nil? ? "." : c }
          .join
          .scan(/.{3}/)
          .to_a
          .join("\n")
  end
end
