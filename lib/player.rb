class Player

  attr_reader :cpu_grid, :player_grid, :shot_at

  def initialize(player_grid, cpu_grid)
    @player_grid = player_grid
    @cpu_grid = cpu_grid
    @shot_at = []
  end

  def place_ship(coords, ship)
    coords.each do |coord|
      player_grid.place_ship_at(coords, ship)
      ship.coordinates << coord
    end
  end

  def shoot_at(coord)
    cpu_grid.shoot_att(coord)
    shot_at << coord
  end

end
