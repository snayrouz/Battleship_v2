require 'arsenal'

class Player

  attr_reader :cpu_grid, :player_grid, :shot_at, :arsenal_size, :ships
    include Arsenal

  def initialize(player_grid, cpu_grid, arsenal_size = 2)
    @player_grid  = player_grid
    @cpu_grid     = cpu_grid
    @shot_at      = []
    @arsenal_size = arsenal_size
    @ships        = self.set_ships(arsenal_size)
  end

  def place_ship(coordinates, ship)
    coordinates.each do |coordinate|
      player_grid.place_ship_at(coordinate, ship)
      ship.coordinates << coordinate
    end
  end

  def shoot_at(coordinate)
    cpu_grid.shoot_att(coordinate)
    shot_at << coordinate
  end

end
