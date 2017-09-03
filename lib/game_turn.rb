#checks for win conditions

class GameTurn

  attr_reader :board, :player, :row_index, :col_index

  def initialize(board, player, row_index, col_index)
    @board = board
    @player = player
    @row_index = row_index
    @col_index = col_index
  end

  def take! #occupying the space permanently
    @board.rows[@row_index][@col_index].player = @player
  end

  def winner?
   horizontal_win? || vertical_win?
  end

  def horizontal_win?
    victory = true
    board.rows[row_index].each do |space|
      victory = false if space.player != @player
    end
    victory
  end

  def vertical_win?
    victory = true
    board.rows .each do |row|
        victory = false if row[@col_index].player != @player
    end
    victory
  end

end
