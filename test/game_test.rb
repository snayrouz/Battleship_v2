# require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'


class GameTest < Minitest::Test

  def test_it_exist
    game = Game.new


    assert_instance_of Game, game
  end

  def test_declare_winner
    game = Game.new
    expected = Player.new

    assert_instance_of Player, game.winner
  end



end
