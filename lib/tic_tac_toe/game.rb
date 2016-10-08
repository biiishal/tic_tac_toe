# Game class that controls the player turns and move solicitation.
# Takes an array of two players at initizaition, randomly sets
# @current_player and @other_player
module TicTacToe
  class Game
    attr_reader :players, :board, :current_player, :other_player
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    # Switches @current_player with the @other player.
    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    # Asks for the @current_user to enter a move in terms of number in 1..9.
    def solicit_move
      "#{current_player.name}: Enter a number between 1 and 9 to make your move: "
    end

    # Takes human input of 1..9 and converts it into grid coordinates.
    def get_move(human_move = gets.chomp)
      human_move_to_coordinate(human_move)
    end

    # Checks if Board#game_over method returns :winner or :draw,
    # and prints respective relevant messages.
    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "The game ended in a tie." if board.game_over == :draw
    end

    def play
      puts "#{@current_player.name} has been randomly selected as player one."
      while true
        board.formatted_grid
        puts ""
        puts solicit_move
        x, y = get_move
        if !board.set_cell(x, y, current_player.color)
          puts "Invalid input!"
          next
        end
        if board.game_over
          puts game_over_message
          board.formatted_grid
          return
        else
          switch_players
        end
      end
    end

    private

    # Maps human_move input to coordinates.
    def human_move_to_coordinate(human_move)
      mapping = {
        "1" => [0, 0],
        "2" => [0, 1],
        "3" => [0, 2],
        "4" => [1, 0],
        "5" => [1, 1],
        "6" => [1, 2],
        "7" => [2, 0],
        "8" => [2, 1],
        "9" => [2, 2]
      }
      mapping[human_move]
    end

  end
end