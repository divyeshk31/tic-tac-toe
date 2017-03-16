class GameLogic
  def self.game_winner(cells, current_move)
    if row_winners?(cells) || col_winners?(cells) || diag_winners?(cells)
      return current_move
    elsif tie?(cells)
      return 'no one'
    end
  end

  private

  def self.row_winners?(cells)
    rows = cells.each_slice(3)
    rows.each { |row| return true if triplets_match?(row) }
    false
  end

  def self.col_winners?(cells)
    cols = cells.group_by { |c| c.pos % 3 }.values
    cols.each { |col| return true if triplets_match?(col) }
    false
  end

  def self.diag_winners?(cells)
    diags = []
    diags << cells.group_by { |l| l.pos % 4 }[1]
    diags << cells.group_by { |r| r.pos % 2 }[1][1...-1]
    diags.each { |diag| return true if triplets_match?(diag) }
    false
  end

  def self.tie?(cells)
    cells.none?{ |cell| cell.val.is_a?(Integer) }
  end

  def self.triplets_match?(ary)
    ary[0].val == ary[1].val && ary[1].val == ary[2].val
  end
end
