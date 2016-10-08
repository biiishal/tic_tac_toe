# Board class represents the Board which have grids which are
# multi-dimentional array elemets with default value 3 x 3 grid layout.
module TicTacToe
  class Board
    attr_reader :grid
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    # Gets Cell object in the specified grid position.
    def get_cell(x, y)
      grid[x][y]
    end

    # Sets Cell.value attribute in the specified grid position.
    def set_cell(x, y, value)
      if get_cell(x, y).value.empty?
        get_cell(x, y).value = value
        true
      else
        false
      end
    end

    # Prints the grid with Cell.value in the grid.
    def formatted_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? "_": cell.value }.join(" ")
      end
    end

    # Calls winner? and draw? predacate methods resp and returns :winner and :draw resp
    def game_over
      return :winner if winner?
      return :draw if draw?
    end

    private

    # Returns default 3x3 grid
    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end

    # Returns winning positions: 3 rows, 3 columns and diagonals
    def winning_positions
      grid + grid.transpose + diagonals
    end

    # Returns pre-defined diagonals for default grid.
    def diagonals
      [
        [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
        [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
      ]
    end

    # Gets Cell.value in the winning positions and returns an array of those values.
    def winning_position_values(winning_position)
      winning_position.map { |cell| cell.value }
    end

    # Checks if the values in a winning position if they have any empty position or all filled.
    # If all empty positions return false
    # If any filled position, check if the values are all same
    # and if same return true
    # If all filled and none same return false
    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).any_empty?
        return true if winning_position_values(winning_position).all_same?
      end
      false
    end

    # Return true if all positions are filled.
    def draw?
      grid.flatten.map { |cell| cell.value }.none_empty?
    end
  end
end