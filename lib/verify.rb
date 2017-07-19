module Verify

  def

  def invalid_coordinates?(coordinates, ship, grid)
    return true if invalid_format?(coordinates)
    return true if not_on_board(coordinates, grid)
    return true if coordinates.length != ship.size
    return true if occupied?(grid, coordinates)
    #true if invalid_format?(coordinates)
    #true if occupied?(grid, coordinates)
  end

  def invalid_format?(coordinates)
    coordinates.any? do |coordinate|
      grid.space_occupied?(coordinate)
    end
  end

  def cannot_fire_at_cell(coordinate, grid)
    invalid_format == true || not_on_board?(coordinate.split, grid)
  end

  def already_occupied?(grid, coordinates)
    grid.space_occupied?(coordinates)
  end

  def occupied?(grid, coordinates)
    coordinates.any? do |coordinate|
      [A-Z].match(coord[0]).nil? || coord[1].to_i == 0
    end
  end

  def not_on_board?(coordinates, grid)
    available_cells = grid.available_cells
    coordinates.any? do |coordinate|
      !available_cells.include?(coordinate)
    end
  end


end
