class Cell

  attr_reader :occupied, :status, :ship

  def initialize
    @occupied = false
    @status = ' '
    @ship = nil
  end

  def place_ship(ship)
    @occupied = true
    @ship = ship
  end

  def shoot_at(coordinates)
    if @occupied && coordinates[1..2].to_i > 9
      @status = ' H'
    elsif !@occupied && coordinates[1..2] > 9
      @status = ' M'
    elsif @occupied
      @status = 'H'
    else
      @status = 'M'
    end
    @ship.hit(coordinates)
  end


end
