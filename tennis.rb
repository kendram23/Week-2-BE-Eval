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
      winner.record_won_ball!
    end

    # Checks to see if player's score is 'win', if so it returns that player
    #
    # If either players' score isn't equal to 'win', it returns the scores
    def wins_game?
      if @player1.score == 'win'
        return @player1
      elsif @player2.score == 'win'
        return @Player2
      else
        return "The score is currently, Player1: #{player1.score} to Player2: #{player2.score}."
      end
    end
  end

  # Player class stores individual information about each player
  #
  # Points - the number of points the player has. Game goes to
  # 4 points as long as the player is up by 2.
  # Otherwise game play continues until the player wins by 2 points
  #
  # Opponent -
  #
  # Advantage - Results in true if one player has the advantage

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
      @opponent = opponent
      @advantage = false
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points +=1
    end

    # Returns the String score for the player.
    #
    # Points - Player wins at 4 points, unless deuce method occurs
    #
    # Deuce - Players must win by 2 points
    #
    # Win - Player has 4 or more points and is up by 2
    def score
      return 'win'       if (@points >= 4 && @points >= opponent.points + 2)
      return 'deuce'     if (@points >= 3 && @points == opponent.points)
      return 'advantage' if (@points >= 3 && @points == opponent.points + 1)
      return 'love'      if  @points == 0
      return 'fifteen'   if  @points == 1
      return 'thirty'    if  @points == 2
      return 'forty'     if  @points == 3
    end

    #
    def has_advantage?
      if (player.score == 'advantage')
        return "has advantage"
        @advantage == true
      else
        player.opponent.advantage == false
      end
    end
  end
end