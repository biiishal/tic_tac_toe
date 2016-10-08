# Board class represents the Board which have grids which are
# multi-dimentional array elemets with default value 3 x 3 grid layout.
module TicTacToe
  class Board
    attr_reader :grid
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def get_cell(x, y)
      grid[x][y]
    end

    def set_cell(x, y, value)
      if get_cell(x, y).value.empty?
        get_cell(x, y).value = value
        true
      else
        false
      end
    end

    def formatted_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? "_": cell.value }.join(" ")
      end
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
    end

    private

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end

    def winning_positions
      grid + grid.transpose + diagonals
    end

    def diagonals
      [
        [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
        [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
      ]
    end

    def winning_position_values(winning_position)
      winning_position.map { |cell| cell.value }
    end

    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).any_empty?
        return true if winning_position_values(winning_position).all_same?
      end
      false
    end

    def draw?
      grid.flatten.map { |cell| cell.value }.none_empty?
    end
  end
end