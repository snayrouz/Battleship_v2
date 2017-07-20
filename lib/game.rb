require_relative 'player'
require_relative 'computer_player'
require_relative 'grid'
require_relative 'validator'
require_relative 'messages'

class Game

  include Messages
  include Verify

  attr_reader :player, :computer, :player_grid, :computer_grid, :start_time

  def initialize(arsenal_size = 2)
    @start_time    = nil
    @shots_fired   = 0
    @player_grid   = Grid.new
    @computer_grid = Grid.new
    @computer = Computer.new(computer_grid, player_grid, arsenal_size)
    @player = Player.new(player_grid, computer_grid, arsenal_size)
  end

 def setup(last)
   player_grid.board_setup(last)
   computer_grid.board_setup(last)
 end

 def computer_place_ships
   computer.place_ships
 end

 def player_place_ship
   player.ship.each do |key, value|
     puts Messages.ask_for_third_ship
     coordinates = get.chomp.upcase.strip.split
     while invalid_coordinates?(coordinates, value, player_grid)
       puts Messages.player_invalid_placement
       coordinates = get.chomp.upcase.strip.split
     end
   end
 end

 def coordinate_error(coordinates, value, player_grid)
   if invalid_format?(coordinates)
     Messages.invalid_coordinates_submit
   elsif coordinates.length < value.size
     Messages.invalid_length
   elsif not_on_board(coordinates, grid)
     Messages.invalid_coordinates_submit
   elsif occupied?(grid, coordinates)
     Messages.cell_full
   elsif invalid_coordinates(coordinates, value, player_grid)
     Messages.order
   end
 end
 # player shot sequence
  def player_shot_sequence
    ships_sunk = {}
    @start_time = Time.now
    until (computer_grid.occupied_cells.length == 0 || player_grid.occupied_cells.length == 0)
      computer_grid.print_board
      player_grid.print_board
      ships_are_sinking(ships_sunk)

      puts Messages.player_turn
      coordinate = gets.chomp.upcase.strip
      while cannot_fire_at_cell(coordinate, player_grid)
        puts Messages.invalid_selection
        coordinate = gets.chomp.upcase
      end

      player.shoot_at(coordinate)
      computer.random_shot(player_grid)
      @shots_fired += 1
    end
    ships_are_sinking(ships_sunk)
  end

  def ships_are_sinking(ships_sunk)
    player.ships.each do |key, ship|
      if ship.sunk?
        puts Messages.sunkage_comp
      end
    end

    computer.ships.each do |key, ship|
      if ship.sunk?
        puts Messages.sunkage_player
      end
    end
  end

  def winner
    if computer_grid.occupied_cells.empty?
      player
    else
      computer
    end
  end

  def end_stats
    puts "It took you #{time_taken} minutes to play."
    puts "You fired #{shots_fired} shots at your opponent."
  end

  def time_taken
    end_time = Time.now
    end_time - start_time
  end

  def shots_fired
    @shots_fired
  end

end
