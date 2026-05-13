require './lib/display'

# Represents a participant in the game, handling score and moves.
class Player
  include Display
  @@p1_choice = ''

  attr_accessor :marker, :name, :score, :player_num

  def initialize(num)
    self.player_num = num
    self.name = set_name
    self.marker = set_marker
    self.score = 0
  end

  def set_name
    print "Player #{player_num} name: "
    self.name = gets.chomp.capitalize
  end

  def set_marker
    return 'O' if @@p1_choice == 'X'
    return 'X' if @@p1_choice == 'O'

    @@p1_choice, self.marker = configure_marker
  end

  # def player_choice
  #   player_position
  # end
end
