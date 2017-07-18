class Grid

  def available_cells
    cells = board.map do |row, column|
      column.map do |key, value|
        row + key
      end
    end
    cells.flatten
  end



  


end
