class Grid

  attr_reader :board, :occupied_cells

  def initialize
    @board = {}
    @occupied_cells = []
  end

  def setup_board(last)
    ('A'..last[0]).to_a.each do |letter|
      board[letter] = Hash.new
      ('1'..last[1..2]).to_a.each do |number|
        board[letter][number] = Cell.new
      end
    end
  end

  def layout
    board.map do |row, columns|
      columns.map do |key, value|
        value
      end
    end
  end

  def available_cells
    cells = board.map do |row, column|
      column.map do |key, value|
        row + key
      end
    end
    cells.flatten
  end

  def shoot_at(coordinates)
    board[coordinates[0]][coordinates[1..2].shoot_at(coordinates)]
    occupied_cells.delete(coordinates)
  end

  def space_occupied?(coordinates)
    board[coordinates[0]][coordinates[1]].occupied
  end

  def place_ship(coordinates, ship)
    nil if space_occupied?(coordinates)
    place = board[coordinates[0]][coordinates[1..2]]
    place.place_ship(ship)
    occupied_cells << coordinates
  end

  def print_board
    board_layout = layout
    column_name = board.keys
    row_name = (1..column_label.length * 6).to_a
    dividor = ''

  end
end
