require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'


class ShipTest < Minitest::Test

  def setup
    @small = Ship.new(2)
    @large = Ship.new(3)
  end

  def test_it_exist_size_default_2
    ship = Ship.new(2)

    assert_equal 2, ship.size
  end

  def test_ship_can_be_length_of_3
    ship = Ship.new(3)

    assert_equal 3, ship.size
  end

  def test_ship_knows_its_coordinates
    ship = Ship.new

    @large.add_coordinate('A2')
    @large.add_coordinate('A3')
    @large.add_coordinate('A4')

    assert_equal ['A2', 'A3', 'A4'], @large.coordinates
  end


end
