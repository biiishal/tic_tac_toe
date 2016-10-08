require_relative "./tic_tac_toe/version"

%w(cell player board core_extensions game).each do |file|
  require_relative "./tic_tac_toe/#{file}.rb"
end

module TicTacToe
  # Your code goes here...
end
