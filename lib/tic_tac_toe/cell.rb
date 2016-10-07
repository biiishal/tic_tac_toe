# Cell class representing single grid cell in the tic tac toe board
# with 3 states: "", O, X
module TicTacToe
  class Cell
    attr_accessor :value

    def initialize(value = '')
      @value = value
    end
  end
end