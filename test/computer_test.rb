require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer'
require './lib/ship'

class ComputerTest < Minitest::Test

  def setup
    @small = 2
    @large = 3
    @computer = Computer.new(computer_grid, player_grid)
  end

  def test_can_change_ship_orientation
    ship = Ship.new
    expected = ['horizontal', 'vertical']

    cpu.set_orientation(ship)

    assert expected.include?(ship.orientation)
  end

  def computer_can_place_ship_not_overlapping
    computer.place_ships
    small_coordinates = computer.ships['small'].coordinates
    large_coordinates = computer.ships['large'].coordinates

    assert (small_coordinates && large_coordinates).empty?
  end

  def test_computer_knows_possible_ships
    expected = { 'small' => 2, 'large' => 3}

    assert_instance_of Computer, computer
    assert_equal expected, computer.arsenal_size
  end

  #test class unfinished
end
