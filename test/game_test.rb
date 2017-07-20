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

    assert_instance_of Player, game.winner
  end

  def test_it_can_setup_board
    game = Game.new

    expected = [[' ', ' ', ' ', ' '],
                [' ', ' ', ' ', ' '],
                [' ', ' ', ' ', ' '],
                [' ', ' ', ' ', ' ']]

    game.setup('D4')

    assert_instance_of Player, game.player
    assert_instance_of of Computer, game.computer
    assert_equal expected, game.player_grid
    assert_equal expected, game.computer_grid
  end

  def test_coordinate_returns_error
    game = Game.new
    occupied = ['A1', 'A2']
    invalid = ['A1', 'B3']
    short =["A1"]
    long = ['A1', 'A5']

    game.setup('D4')

    assert_equal 

  end


end
