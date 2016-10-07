# Player class which keeps track of player sign O or X and name
module TicTacToe
  class Player
    attr_reader :name, :color
    def initialize(input)
      @name = input.fetch(:name)
      @color = input.fetch(:color)
    end
  end
end