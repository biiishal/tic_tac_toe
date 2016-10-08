require_relative "../lib/tic_tac_toe.rb"

puts "Welcome to Tic Tac Toe."
puts "Enter name for player1: "
name_1 = gets.chomp
puts "Enter name for player2: "
name_2 = gets.chomp
player1 = TicTacToe::Player.new({color: "X", name: name_1})
player2 = TicTacToe::Player.new({color: "O", name: name_2})

players = [player1, player2]

TicTacToe::Game.new(players).play