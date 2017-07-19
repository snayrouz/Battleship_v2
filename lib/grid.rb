require_relative 'cell'

class Grid

  attr_reader :board, :occupied_cells

  def initialize
    @board          = {}
    @occupied_cells = []
  end

  def setup_board(last)
    ('A'..last[0]).to_a.each do |letter|
      board[letter] = Hash.new
    end
      ('1'..last[1..2]).to_a.each do |number|
        board[letter][number] = Cell.new
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

  def shoot_at(coordinate)
    board[coordinate[0]][coordinate[1..2].shoot_at(coordinate)]
    occupied_cells.delete(coordinate)
  end

  def space_occupied?(coordinate)
    board[coordinate[0]][coordinate[1]].occupied
  end

  def place_ship(coordinate, ship)
    nil if space_occupied?(coordinate)
    place = board[coordinate[0]][coordinate[1..2]]
    place.place_ship(ship)
    occupied_cells << coordinate
  end

  def print_board
    board_layout = layout
    column_name = board.keys
    row_name = (1..column_name.length).to_a
    boarder = '=' * (column_label.length * 6)
    puts boarder
    puts '. ' + row_name.join(' ')
    board_layout.each_with_index do |row, index|
      puts column_name[index] + row.join(' ')
    end
    puts boarder
  end

end
