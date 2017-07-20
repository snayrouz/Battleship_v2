require 'simplecov'
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/cell"
require_relative "../lib/ship"

class CellTest < Minitest::Test

  attr_reader :cell, :ship

  def setup
    @cell = Cell.new
    @ship = Ship.new
  end

  def test_cell_empty_by_default
    assert_instance_of Cell, cell

    refute.cell.occupied
  end

  def test_cell_can_become_occupied
    cell.place_ship(ship)

    assert cell.occupied
  end

  def test_knows_miss
    cell.shoot_at('A1')

    assert_equal 'M', cell.status
  end


  def test_knows_hit
    cell.place_ship(ship)
    cell.shoot_at('A1')

    assert_equal 'H', cell.status
  end


end
