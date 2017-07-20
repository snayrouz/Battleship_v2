require 'simplecov'
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/verify"
require_relative "../lib/ship"
require_relative "../lib/grid"

class VerifyTest < Minitest::Test


 def test_it_knows_valid_coordinates
   verify = Verify.new

   small = Ship.new
   grid = Grid.new
   grid.board_setup('D4')
   valid_small_coordinates = ['A1', 'B1']

   refute verify.invalid_coordinates?(valid_small_coordinates, small, grid)
 end

 def test_knows_invalid_coordinates
   verify = Verify.new

   small = Ship.new
   large = Ship.new
   grid = Grid.new
   grid.board_setup('D4')
   invalid_small_coords = ['A1', 'B3']
   invalid_large_coords = ['A1', 'B2']

   assert verify.invalid_coordinates?(invalid_small_coords, small, grid)
   assert verify.invalid_coordinates?(invalid_large_coords, large, grid)
 end

 def test_invalid_format
   verify = Verify.new

   valid_format = ['A1', 'B2']
   invalid_format = ['AB', '12']

   refute verify.invalid_format?(valid_format)
   assert verify.invalid_format?(invalid_format)
 end

 def test_knows_coordinates_not_on_board
   grid = Grid.new
   grid.board_setup('D4')
   assert verify.not_on_board?(['E3', 'G6'], grid)
   refute verify.not_on_board?(['B2', 'B3'])
 end

 def test_cannot_fire_at_cell
   grid = Grid.new
   grid.board_setup('D4')

   assert verify.cannot_fire_at_cell('Z3', grid)
   refute verify.cannot_fire_at_cell('D2', grid)
 end

end
