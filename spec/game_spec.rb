require "spec_helper"

module TicTacToe
  describe Game do
    let(:bob) { Player.new(color: "X", name: "bob")}
    let(:frank) { Player.new(color: "O", name: "frank")}

    context "#initialize" do
      it "randomly selects a current player" do
        expect_any_instance_of(Array).to receive(:shuffle) { [frank, bob] }
        game = Game.new([frank, bob])
        expect(game.current_player).to eq frank
      end

      it "randomly selects the other player" do
        expect_any_instance_of(Array).to receive(:shuffle) { [frank, bob] }
        game = Game.new([frank, bob])
        expect(game.other_player).to eq bob
      end
    end

    context "#switch_players" do
      it "will set @current_player to @other_player" do
        game = Game.new([frank, bob])
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq other_player
      end

      it "will set @other_player to @current_player" do
        game = Game.new([frank, bob])
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq current_player
      end
    end

    context "#solicit_move" do
      it "will ask current user for a move from 1 to 9" do
        game = Game.new([frank, bob])
        allow(game).to receive(:current_player) { bob }
        expected = "bob: Enter a number between 1 and 9 to make your move: "
        expect(game.solicit_move).to eq expected
      end
    end

    context "#get_move" do
      it "converts human move of '1' to [0, 0]" do
        game = Game.new([frank, bob])
        expect(game.get_move("1")).to eq [0, 0]
      end

      it "converts human move of '9' to [2, 2]" do
        game = Game.new([frank, bob])
        expect(game.get_move("9")).to eq [2, 2]
      end
    end

    context "#game_over_message" do
      it "returns '{current player name} won!' if board shows a winner" do
        game = Game.new([frank, bob])
        allow(game).to receive(:current_player).and_return(bob)
        allow(game.board).to receive(:game_over) { :winner }
        expect(game.game_over_message).to eq "bob won!"
      end
    end

  end
end