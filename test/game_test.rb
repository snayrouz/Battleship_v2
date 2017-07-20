require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/messages'


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
    invalid = ['A1', 'B3']
    short =["A1"]
    long = ['A1', 'A5']

    game.setup('D4')

    assert_equal
    assert_equal invalid, Messages.player_invalid_placement
    assert_equal short, Messages.invalid_length
    assert_equal long, Messages.invalid_length
  end


  def test_computer_can_place_ships
    skip #unsure how to test random
    game = Game.new

    game.setup('D4')

    assert
  end

  def test_who_can_win
    game = Game.new

    game.computer_grid.occupied_cells.clear
    assert_instance_of Player, game.winner
  end

end
