class Tictactoe
  attr_reader :board

  def initialize(board = [nil] * 9)
    @board = board
  end

  def print
    @board.map { |c| c.nil? ? "." : c }
          .join
          .scan(/.{3}/)
          .to_a
          .join("\n")
  end

  def take_slot(is_x, row, col)
    index = row * 3 + col

    return false if @board[index]

    @board[index] = is_x ? "X" : "O"

    true
  end
end
