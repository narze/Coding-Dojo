class Tictactoe
  attr_accessor :board

  def initialize(board = [nil] * 9)
    @board = board
  end

  # Print board in 3x3 format
  # Non-played slot is printed in .
  # Example :
  #    .X.
  #    XO.
  #    ..O
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
    if win?("X")
      "X"
    elsif win?("O")
      "O"
    else
      nil
    end
  end

  private

    def win?(p)
      board_matrix = @board.each_slice(3)
                           .to_a

      board_matrix.include?([p, p, p]) ||
        board_matrix.transpose.include?([p, p, p]) ||
        (@board[0] == p && @board[4] == p && @board[8] == p) ||
        (@board[2] == p && @board[4] == p && @board[6] == p)
    end
end
