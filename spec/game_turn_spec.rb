require 'spec_helper'

describe GameTurn do
  let(:board) { Board.new }
  let(:player) { Player.new('x') }
  let(:row_index) { 0 }
  let(:col_index) { 0 }
  let(:turn) { GameTurn.new(board, player, row_index, col_index) }
  let(:player) { player = Player.new('x') }
  let(:opposing_player) { player = Player.new('o') }

  it 'has a board' do
    expect(turn.board).to eq(board)
  end

  it 'has a player' do
    expect(turn.player).to eq(player)
  end
  #
  it 'has a row index' do
    expect(turn.row_index). to eq(row_index)
  end

  it 'has a col index' do
    expect(turn.col_index).to eq(col_index)
  end

  context 'checking for win conditions' do
    context 'horizontally' do
      it 'does have a win if a row of the same player is found' do
        winning_board = Board.new
        2.times do |index|
          winning_board.add_turn(player, 0, index)
        end

        winning_turn = GameTurn.new(winning_board, player, 0, 2)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end

      it 'does not have a win if a row is interrupted by another player' do
        losing_board = Board.new
        losing_board.add_turn(opposing_player, 0, 0)
        losing_board.add_turn(opposing_player, 0, 1)

        losing_turn = GameTurn.new(losing_board, player, 0, 2)
        losing_turn.take!
        expect(losing_turn).to_not be_winner
      end

      it 'does not have a win if an unoccupied space is found in a row' do
        losing_board = Board.new
        losing_turn = GameTurn.new(losing_board, player, 0, 0)
        expect(losing_turn).to_not be_winner
      end
    end
  end

  context 'vertical win conditions' do
    it 'is a winner if the column is occupied by one player exclusively' do
      winning_board = Board.new
      2.times do |index|
        winning_board.add_turn(player, index, 0)
      end

      winning_turn = GameTurn.new(winning_board, player, 2, 0)
      winning_turn.take!
      expect(winning_turn).to be_winner
    end

    it 'is not a winner if the column is interrupt by another player' do
      losing_board = Board.new

      losing_board.add_turn(opposing_player, 0, 0)
      losing_board.add_turn(opposing_player, 1, 0)

      losing_turn = GameTurn.new(losing_board, player, 2, 0)
      losing_turn.take!
      expect(losing_turn).to_not be_winner
    end

    it 'is not a winner if an unoccupied space is found in the column' do
      losing_board = Board.new


      losing_turn = GameTurn.new(losing_board, player, 0, 0)
      losing_turn.take!
      expect(losing_turn).to_not be_winner
    end

  end
end
