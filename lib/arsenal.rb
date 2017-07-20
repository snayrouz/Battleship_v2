require_relative 'ship'

module Arsenal

  def arsenal_size
    {'small' => 2, 'large' => 3}
  end

  def set_ships(arsenal_size)
    available_ships = {}
    arsenal_size.each do |key, value|
      if value <= arsenal_size
        arsenal_size -= size
        actual_ships[key] = Ship.new(size)
      end
    end
    available_ships
  end

end
