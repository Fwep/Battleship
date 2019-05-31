class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board)
    @board = board
    @player = player
  end

  def attack(pos)
    x, y = pos[0], pos[1]
    @board[[x,y]] = "x".to_sym
  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  def play_turn
    move = @player.get_play
    attack(move)
  end

end
