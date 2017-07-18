require 'colorize'
include Messages

puts Welcome

while true
  puts options
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
puts comp_intro
