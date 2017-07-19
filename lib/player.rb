class Player

  attr_reader :cpu_grid, :player_grid, :shot_at

  def initialize(player_grid, cpu_grid)
    @player_grid = player_grid
    @cpu_grid = cpu_grid
    @shot_at = []
    
  end

  def place_ship(coordinates, ship)
    coordinates.each do |coordinate|
      player_grid.place_ship_at(coordinates, ship)
      ship.coordinates << coord
    end
  end

  def shoot_at(coordinate)
    cpu_grid.shoot_att(coordinate)
    shot_at << coord
  end

end
