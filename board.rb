require_relative 'cell'
require_relative 'game_logic'
require_relative 'ui'

PLAYERS = ['x', 'O']

class Board
  attr_reader :cells
  attr_accessor :winner, :current_move

  def initialize
    @cells = []
    @current_move = PLAYERS.sample
    @winner = false
    set_new_board
  end

  def play
    until @winner
      change_turn
      UI.draw_board(@cells)
      make_move
      if winner = GameLogic.game_winner(@cells, @current_move)
        set_winner(winner)
      end
    end
    UI.crown_winner(@winner)
    UI.draw_board(@cells)
  end

  private

  def set_new_board
    (1..9).each { |n| @cells << Cell.new(pos: n, val: n) }
  end

  def make_move
    move = UI.ask_for_move(@current_move)
    cell = find_cell(move)
    cell ? cell.val = @current_move : UI.yell
  end

  def find_cell(pos)
    @cells.find { |cell| cell.pos == pos && cell.is_open? }
  end

  def change_turn
    @current_move = (PLAYERS - [@current_move]).join
  end

  def set_winner(winner)
    @winner = winner
  end
end
