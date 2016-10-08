require "spec_helper"

module TicTacToe
  describe Board do
    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new("X") }
    let(:y_cell) { TestCell.new("Y") }
    let(:empty) { TestCell.new("") }

    context "#initialize" do
      it "initializes the board with a grid" do
        expect { Board.new({grid: "Grid"}) }.not_to raise_error
      end

      it "sets the grid with 3 rows by default" do
        board = Board.new
        expect(board.grid.size).to eq(3)
      end

      it "creates 3 things in each row by default" do
        board = Board.new
        board.grid.each do |row|
          expect(row.size).to eq(3)
        end
      end
    end

    context "#grid" do
      it "returns grid value" do
        board = Board.new({grid: "grid"})
        expect(board.grid).to eq "grid"
      end
    end

    context "#get_cell" do
      it "returns value of the cell based on x, y co-ordinates" do
        grid = [['','',''],['','',''],['','','something']]
        board = Board.new({grid: grid})
        expect(board.get_cell(2, 2)).to eq "something"
      end
    end

    context "#set_cell" do
      it "sets value to a cell based on x, y co-ordinates and a value" do
        Cat = Struct.new(:value)
        grid = [[Cat.new("meow"),'',''],['','',''],['','','']]
        board = Board.new
        board.set_cell(0, 0, "roaarrr")
        expect(board.get_cell(0, 0).value).to eq "roaarrr"
      end
    end

    context "#game_over" do
      it "returns :winner if winner? is true" do
        board = Board.new
        allow(board).to receive(:winner?) { true }
        expect(board.game_over).to eq :winner
      end

      it "returns :draw if winner? is false and draw? is true" do
        board = Board.new
        allow(board).to receive(:winner?) { false }
        allow(board).to receive(:draw?) { true }
        expect(board.game_over).to eq :draw
      end

      it "returns false if winner? and draw? are false" do
        board = Board.new
        allow(board).to receive(:winner?) { false }
        allow(board).to receive(:draw?) { false }
        expect(board.game_over).to be_falsey
      end

      it "returns :winner when row has objects with values that are all the same" do
        grid = [
          [x_cell, x_cell, x_cell],
          [y_cell, y_cell, x_cell],
          [x_cell, y_cell, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when column has objects with values that are all the same" do
        grid = [
          [x_cell, y_cell, x_cell],
          [x_cell, y_cell, y_cell],
          [x_cell, x_cell, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when diagonal has objects with values that are all the same" do
        grid = [
          [x_cell, y_cell, y_cell],
          [x_cell, x_cell, y_cell],
          [y_cell, y_cell, x_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :draw when all spaces in the board are not empty" do
        grid = [
          [x_cell, y_cell, x_cell],
          [x_cell, y_cell, x_cell],
          [y_cell, x_cell, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :draw
      end

      it "returns false when there is no winner or draw" do
        grid = [
          [x_cell, '', ''],
          [y_cell, '', ''],
          [x_cell, '', '']
        ]
        board = Board.new
        expect(board.game_over)
      end
    end

  end
end