# the computer is an object

class Computer

  def initialize(cpu_grid, player_grid)
    @cpu_grid = cpu_grid
    @player_grid = player_grid
    @shot_at = []

  end

  def random_shot(player_grid)
    available = player_grid.available_cells
    coordinates = (available - shot_at).sample
    shoot_at(player_grid, coordinates)
  end

  def shoot_at(player_grid, coordinates)
    player_grid.shoot_at(coordinates)
    shot_at << coordinates
  end


end
