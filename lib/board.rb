class Board

  def initialize(num_rows_and_columns = 3)
    @board = []
    num_rows_and_columns.times do
      row = []
      num_rows_and_columns.times do
        row << nil
      end
      @board << row
    end
  end


  def rows
    @board
  end

  def add_turn(player, row_index, col_index)
    @board[row_index][col_index] = player
  end


  def print
    board_print = ''
    @board.each_with_index do |row, index|
      spots = []
      row.each do |space|
        if space.nil?
          spots << '-'
        else
          spots << space
        end
      end
      board_print << spots.join(' | ') + "\n"
      if index < row.size - 1
        board_print << '-' * spots.join(' | ').size + "\n"
      end
    end
    board_print
  end

  def empty_spaces?
    @board.each do |row|
      row.each do |space|
        return true if space.nil?
      end
    end

    return false
  end

  def winner?
    false
  end

end

# require 'pry'
# binding.pry
