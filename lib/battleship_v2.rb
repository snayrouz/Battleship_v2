# require 'colorize'
require_relative 'game'
require_relative 'messages'

include Messages

puts Messages.Welcome

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

# here's will the game will begin

game.computer_place_ships
puts Messages.comp_intro

game.player_place_ships
puts

game.player_shoots

if game.winner.class = Player
  puts Messages.player_win
else
  puts Messages.computer_win
end

game.end_stats
