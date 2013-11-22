module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
      @opponent = opponent
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      if @player.wins_ball
        @player.points += 1
      end
    end

    # Returns the String score for the player.
    def score
      case
      when @points == 0
        return 'love'
      when @points == 1
        return "fifteen"
      when @points == 2
        return "thirty"
      when @points == 3
        return "forty"
      when @points == 4
        return game
      else
        return "That's not a valid score"
      end
    end
  end
end