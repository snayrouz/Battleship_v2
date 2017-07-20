require './lib/game'
require './lib/messages'

# game = Game.new(2)
include Messages


puts Messages.welcome

while true
  puts Messages.options
  answer = gets.chomp.downcase

  if answer == "p" || answer == "play"
    break
  elsif answer == "i" || answer == "instructions"
    puts instructions
  elsif answer == "q" || answer == "quit"
    exit
  else
    puts invalid_selection
  end
end

# Game.setup('D4')
# Game.computer_place_ships
puts Messages.comp_intro

Game.player_place_ships
puts Messages.ask_for_third_ship

game.player_shoots

if game.winner.class == Player
  puts Messages.player_win
else
  puts Messages.computer_win
end

game.end_stats
