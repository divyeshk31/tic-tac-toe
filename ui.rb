class UI
  def self.draw_board(cells)
    print_blank_line
    cells.each_slice(3) do |row|
      row.each do |cell|
        print cell.val
        print ' | ' unless cell == row.last
      end
      print_blank_line
    end
    print_blank_line
  end

  def self.crown_winner(winner)
    print_blank_line
    puts 'the game is over!'
    puts "the winner is #{winner}!"
    puts "congratulations to the winner!" unless winner == 'no one'
    print_blank_line
    puts 'here is the final board--'
  end

  def self.ask_for_move(current_move)
    puts "it's player #{current_move}'s turn."
    puts "in what cell do you want to make your move?"
    gets.chomp.to_i
  end

  def self.yell
    print_blank_line
    puts "you didn't play by the rules. you lose a turn"
    print_blank_line
  end

  private

  def self.print_blank_line
    print "\n"
  end
end
