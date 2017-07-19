# the computer is an object

class Computer

  def initialize(cpu_grid, player_grid)
    @cpu_grid    = cpu_grid
    @player_grid = player_grid
    @shot_at     = []
  end

  def place_ships
    available_cells = cpu_grid.available_cells
    occupied_cells = []
    @ships.each do |size, ship|
      set_orientation(ship)
      if ship.orientation == 'vertical'
        place_vertical_ship(ship, available_cells, occupied_cells)
      else
        place_horizontal_ship(ship, available_cells, occupied_cells)
      end
    end
  end

  def place_vertical_ship
    front = make_front_vertical(ship)
    coord_prospect = [front]
    coord_vert_prospect(ship, coord_prospect)

    if (coord_prospect & occupied_cells).empty?
      coord_prospect.each do |coord|
        cpu_grid.place_ship_at(coord, ship)
        occupiedl_cells << available_cells.delete(coord)
      end
    else
      place_vertical_ship(ship, available_cells, occupied_cells)
    end
  end

  def make_front_vertical
    rows = cpu_grid.board.keys
    low = (rows.length - ship.size) +1
    front_prospect = rows.first(low)
    front_prospect.sample + rand(1..rows.length).to_s
  end

  def place_horizontal_ship(ship, available_cells, occupied_cells)
    front = make_front_horizontal(ship)
    coord_prospect = [front]
    coord_horz_prospect(ship, coord_prospect)

    if (coord_prospect & occupied_cells).empty?
      coord_prospect.each do |coord|
        cpu_grid.place_ship_at(coord, ship)
        ship.coordinates << coord
        occupied_cells << available_cells.delete(coord)
      end
    else
      place_horz_ship(ship, available_cells, occupied_cells)
    end
  end

  def make_front_horizontal
    rows = cpu_grid.board.keys
    high = (rows.length - ship.size) + 1
    column = rand(1..high).to_s
    rows.sample + column
  end


  # need place ship method. Take from other version

  def random_shot(player_grid)
    available = player_grid.available_cells
    coordinates = (available - shot_at).sample
    shoot_at(player_grid, coordinates)
  end

  def shoot_at(player_grid, coordinates)
    player_grid.shoot_at(coordinates)
    shot_at << coordinates
  end

  def open_cells
    cpu_grid.available_cells
  end

  def set_orientation
    ship.orientation = ['horizontal', 'veritcal'].sample
  end

end
