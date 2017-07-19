class Ship

  attr_reader :size, :coordinates
  attr_accessor :orientation

  def initialize(size = 2)
    @size        = size
    @coordinates = []
    @orientation = 'horizontal'
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
