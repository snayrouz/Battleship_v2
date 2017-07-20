require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/player'
require_relative '../lib/computer_player'
require_relative '../lib/grid'
require_relative '../lib/ship'

class PlayerTest < Minitest::Test

  attr_reader :player, :cpu_grid, :player_grid
  def setup
    @cpu_grid = Grid.new
    @player_grid = Grid.new
    player_grid.board_setup('D4')
    @player = Player.new(player_grid, cpu_grid)
  end

  def test_player_can_place_ships
    player = Player.new

    player.place_ship(['A1', 'A2'])
    board = player.player_grid.board

    assert_instance_of Ship, board['C', '1'].ship
    assert_instance_of Ship, board['C', '2'].ship
  end

  def test_set_ships_gives_correct_results
    expected = ['small', 'large']
    actual = player.set_ships(2).keys

    assert_equal expected, actual
    assert_instance_of Ship, player.set_ships(2)['small']
  end

  def test_player_can_shoot_at_computer
    player = Player.new
    small = Ship.new
    computer_grid.place_ship_at('B2', small)
    computer_grid.place_ship_at('B4', small)
    expected = [[' ', ' ', ' ', ' '],
                [' ', ' ', 'H', ' '],
                [' ', ' ', 'M', ' '],
                [' ', ' ', ' ', ' ']]

    player.shoot_at('B3')
    player.shoot_at('C3')

    assert_equal expected, cpu_grid.board_layout
  end

end
