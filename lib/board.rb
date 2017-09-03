require_relative 'board_space'
require_relative 'game_turn'
require_relative 'player'

class Board

  def initialize(num_rows_and_columns = 3)
    @board = []
    num_rows_and_columns.times do
      row = []
      num_rows_and_columns.times do
        row << BoardSpace.new
      end
      @board << row
    end
  end


  def rows
    @board
  end

  def add_turn(player, row_index, col_index)
    @last_turn = GameTurn.new(self, player, row_index, col_index)
    @last_turn.take!
  end


  def print
    board_print = ''
    @board.each_with_index do |row, index|
      spots = []
      row.each do |space|
        spots << space.to_char
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
        return true if !space.occupied?
      end
    end

    return false
  end

  def winner?
    if @last_turn
      @last_turn.winner?
    else
      false
    end
  end

end

require 'pry'
binding.pry
