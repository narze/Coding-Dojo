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
    if x_win?
      "X"
    elsif o_win?
      "O"
    else
      nil
    end
  end

  def x_win?
    board_matrix = @board.each_slice(3)
                         .to_a

    board_matrix.include?(["X", "X", "X"]) ||
      board_matrix.transpose.include?(["X", "X", "X"]) ||
      (@board[0] == "X" && @board[4] == "X" && @board[8] == "X") ||
      (@board[2] == "X" && @board[4] == "X" && @board[6] == "X")
  end

  def o_win?
    board_matrix = @board.each_slice(3)
                         .to_a

    board_matrix.include?(["O", "O", "O"]) ||
      board_matrix.transpose.include?(["O", "O", "O"]) ||
      (@board[0] == "O" && @board[4] == "O" && @board[8] == "O") ||
      (@board[2] == "O" && @board[4] == "O" && @board[6] == "O")
  end
end
