# This module creates and maintains the tic-tac-toe board
module Display
  DIVIDER = '-----------'.freeze

  def set_row
    row1 =   " #{@board[1]} | #{@board[2]} | #{@board[3]} "
    row2 =   " #{@board[4]} | #{@board[5]} | #{@board[6]} "
    row3 =   " #{@board[7]} | #{@board[8]} | #{@board[9]} "
    [row1, row2, row3]
  end

  def showboard
    row = set_row
    puts 'TIC TAC TOE'
    puts "#{row[0]}\n#{DIVIDER}\n#{row[1]}\n#{DIVIDER}\n#{row[2]}"
    puts "#{@p1.marker}: #{@p1.score}  (#{@p1.name})"
    puts "#{@p2.marker}: #{@p2.score}  (#{@p2.name})"
  end

  def display_result
    if @winner.nil?
      puts 'Game is a draw'
    else
      puts "#{@winner} won!!"
    end
    showboard
  end

  def player_position
    input = ''
    loop do
      print "#{@current_player.name} Chose your position: "
      input = gets.chop.to_i
      break if @valid_positions.include?(input)

      puts 'Please enter again'
    end
    @valid_positions.delete(input)
    input
  end

  def configure_marker
    input = ''
    loop do
      print 'Chose your marker (X or O): '
      input = gets.chop.upcase
      break if %w[X O].include?(input)

      puts 'Please enter again'
    end
    input
  end

  def continue?
    input = ''
    loop do
      print 'Do you want to play another game (Y/N)? '
      input = gets.chop.upcase
      break if %w[Y N].include?(input)
    end
    input == 'Y'
  end
end
