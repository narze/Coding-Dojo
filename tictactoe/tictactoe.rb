class Tictactoe
  attr_accessor :board

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

  def get_winner
    if @board.each_slice(3)
             .to_a
             .include?(["X", "X", "X"])
      "X"
    elsif @board.each_slice(3)
                .to_a
                .transpose
                .include?(["X", "X", "X"])
      "X"
    elsif @board[0] == "X" && @board[4] == "X" && @board[8] == "X"
      "X"
    elsif @board[2] == "X" && @board[4] == "X" && @board[6] == "X"
      "X"
    elsif @board.each_slice(3)
             .to_a
             .include?(["O", "O", "O"])
      "O"
    elsif @board.each_slice(3)
                .to_a
                .transpose
                .include?(["O", "O", "O"])
      "O"
    elsif @board[0] == "O" && @board[4] == "O" && @board[8] == "O"
      "O"
    elsif @board[2] == "O" && @board[4] == "O" && @board[6] == "O"
      "O"
    end
  end
end
