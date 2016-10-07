require "spec_helper"

module TicTacToe
  describe Player do

    context "#initialize" do
      it "raises an exception when initialized with {}" do
        expect { Player.new({}) }.to raise_error
      end

      it "does not raise exception when initialized with valid hash" do
        input = {name: "Game", color: "X"}
        expect { Player.new(input) }.not_to raise_error
      end
    end

    context "#color" do
      it "returns the color" do
        input = {name: "John", color: "O"}
        player = Player.new(input)
        expect(player.color).to eq "O"
      end
    end

    context "#name" do
      it "returns the name" do
        input = {name: "John", color: "X"}
        player = Player.new(input)
        expect(player.name).to eq "John"
      end
    end

  end
end