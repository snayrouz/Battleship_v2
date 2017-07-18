class Ship

  attr_reader :size, :coordinates

  def initialize(size = 2)
    @size        = size
    @coordinates = []
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


end
