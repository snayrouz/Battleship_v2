module Arsenal

  def possible_ships
    {'small' => 2, 'large' => 3}
  end

  def set_ships(possible_ships)
    available_ships = {}
    possible_ships.each do |key, value|
      if value <= possible_ships
        possible_ships -= size
        actual_ships[key] = Ship.new(size)






end
