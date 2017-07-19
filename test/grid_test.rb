require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grid'

class GridTest < Minitest::Test

  def test_exists_and_empty_by_default
    grid = Grid.new

    assert_instance_of Grid, grid
  end

  def test_grid_layout
    grid = Grid.new

    
  end

  def test_grid_knows_available_cells
    grid = Grid.new
    expected = ['A1', 'A2', 'A3', 'A4',
                'B1', 'B2', 'B3', 'B4',
                'C1', 'C2', 'C3', 'C4',
                'D1', 'D2', 'D3', 'D4']

    grid.setup_board('D4')
    assert_equal expected, grid.available_cells
  end

end
