require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer'
require './lib/ship'

class ComputerTest < Minitest::Test

  def setup
    @small = 2
    @large = 3
  end

  def test_can_change_ship_orientation
    ship = Ship.new
    expected = ['horizontal', 'vertical']

    cpu.set_orientation(ship)

    assert expected.include?(ship.orientation)
  end


end
