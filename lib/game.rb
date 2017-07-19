require_relative 'player'
require_relative 'computer_player'
require_relative 'grid'
require_relative 'validator'
require_relative 'messages'

class Game

  inlude Messages, Verify
  attr_reader :player, :computer, :player_grid, :computer_grid, :start_time

  def initialize
    @start_time    = nil
    @shots_fired   = 0
    @player_grid   = Grid.new
    @computer_grid = Grid.new

  end
 # will have to setup the game
 # have computer place ships
 # have player place ships
 # have invalid messages for invalid inputs
 # player shot sequence
 # method for knowing when oppenents ship's have sunk

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
