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

    def wins_game
      if    (@player1.points >= 4 && @player1.points >= player2.points + 2)
        return @player1
      else (@player2.points >= 4 && @player2.points >= player1.points + 2)
        return @player2
      end
    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
      @opponent = opponent
      # @advantage = advantage
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points +=1
    end

    # Returns the String score for the player.
    #
    # Points - Player wins at 4 points, unless scout method occurs
    def score
      return 'love'    if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty'  if @points == 2
      return 'forty'   if @points == 3
      # if player1.points == 3 && player2.points == 3
      #   return "Deuce: Players must win by 2 points"
      # else

      # end
    end

    #If players are tied at 3, the winner must win by 2 points
    # def advantage
        # if (player1.)
    #   @advantage +=1
    #   if @advantage == 2
    #     wins.wins_game
    #   end
    # end

    # # When both players have 3 points each, the game has to be won
    # # by 2 additional points.
    # # Player1 = 6 & Player2 = 5

    # def deuce
    # end
  end
end