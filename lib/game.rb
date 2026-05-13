require './lib/display'

# The class for running the game
class Game
  include Display
  WINNING_LINE = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ].freeze

  attr_accessor :board, :p1, :p2, :winner, :game_over, :valid_positions

  def initialize(player1, player2)
    self.board = ['-', 1, 2, 3, 4, 5, 6, 7, 8, 9]
    self.valid_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    self.p1 = player1
    self.p2 = player2
    self.winner = nil
    self.game_over = false
  end

  def start
    continue_game = true
    while continue_game
      clear
      @current_player = p1.marker == 'X' ? p1 : p2
      play_game
      continue_game = continue?
      switch_markers
    end
  end

  def switch_markers
    marker = p1.marker
    p1.marker = p2.marker
    p2.marker = marker
  end

  def play_game
    until game_over
      showboard
      board[player_position] = @current_player.marker
      check_winner
      check_draw
      switch_current_player
    end
    update_score
    display_result
  end

  def check_winner
    win = WINNING_LINE.any? { |line| line.all? { |i| board[i] == @current_player.marker } }
    return unless win

    self.winner = @current_player.name
    self.game_over = true
  end

  def check_draw
    draw = board.none?(Integer)
    return unless draw

    self.winner = nil
    self.game_over = true
  end

  def switch_current_player
    @current_player = @current_player == p1 ? p2 : p1
  end

  def update_score
    if winner == p1.name
      p1.score += 1
    elsif winner == p2.name
      p2.score += 1
    end
  end

  def clear
    self.board = ['-', 1, 2, 3, 4, 5, 6, 7, 8, 9]
    self.winner = nil
    self.game_over = false
    self.valid_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
