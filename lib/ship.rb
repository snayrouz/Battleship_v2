class Ship

  attr_reader :size, :coordinates
  attr_accessor :orientation

  def initialize(size = 2)
    @size        = size
    @coordinates = []
    @orientation = 'horizontal'

  end

  def possible_ships
    {'small' => 2, 'large' => 3}
  end

  def sunk?
    @coordinates.empty?
  end

  def hit(coordinate)
    @coordinates.delete(coordinate)
  end

  def add_coordinate(coordinate)
    coordinates << coordinate
  end

  def set_ships(possible_ships)
    available_ships = {}
    possible_ships.each do |key, value|
      if value <= possible_ships
        possible_ships -= size
        actual_ships[key] = Ship.new(size)


end
