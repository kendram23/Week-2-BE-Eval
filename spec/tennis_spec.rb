require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'pry-plus'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do
      expect(game.player1.opponent).to be(game.player2)
      expect(game.player2.opponent).to be(game.player1)
    end
  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(game.player1)

      expect(game.player1.points).to eq(1)
      
      game.wins_ball(game.player2)
      game.wins_ball(game.player2)

      expect(game.player2.points).to eq(2)
    end
  end

  describe '#wins_game?' do
    it 'displays the winner of the game' do
      game.wins_ball(game.player1)
      game.wins_ball(game.player1)
      game.wins_ball(game.player1)
      game.wins_ball(game.player1)
      game.wins_ball(game.player2)
      game.wins_ball(game.player2)
      game.wins_ball(game.player2)
      game.wins_ball(game.player1)
      
      expect(game.wins_game?).to be(game.player1)
      
      game.wins_ball(game.player2)
      game.wins_ball(game.player1)
      game.wins_ball(game.player1)
      game.wins_ball(game.player1)
      game.wins_ball(game.player2)
      game.wins_ball(game.player2)
      game.wins_ball(game.player2)
      game.wins_ball(game.player1)
      game.wins_ball(game.player2)
      game.wins_ball(game.player2)
      game.wins_ball(game.player2)
      game.wins_ball(game.player2)
      
      expect(game.wins_game?).to be(game.player2)
    end
  end
end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new


    return player
  end

  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do
        player.points = 2

        expect(player.score).to eq('thirty')
      end
    end

    context 'when points is 3' do
      it 'returns forty' do
        player.points = 3

        expect(player.score).to eq('forty')
      end
    end

  end

  describe '#score when players have to win by 2' do
    context 'players are tied at 3' do
      it 'returns deuce' do
        player.points = 4
        player.opponent.points = 4

        expect(player.score).to eq('deuce')
      end
    end

        context 'player has 4 or more points and is up by 1' do
      it "returns advantage" do
        player.points = 5
        player.opponent.points = 4

        expect(player.score).to eq('advantage')
      end
    end

    context 'player has 4 or more points and is winning by 2' do
      it 'returns win' do 
        player.points = 5
        player.opponent.points = 3

        expect(player.score).to eq('win')
      end 
    end

    context 'the players have a really really long match' do
      it 'returns deuce' do 
        player.points = 50000
        player.opponent.points = 50000

        expect(player.score).to eq('deuce')
      end

      it 'returns advantage' do
        player.points = 50001
        player.opponent.points = 50000

        expect(player.score).to eq('advantage')
      end
      
      it 'returns wins' do
        player.points = 50002
        player.opponent.points = 50000

        expect(player.score).to eq('win')
      end 
    end
  end
end
