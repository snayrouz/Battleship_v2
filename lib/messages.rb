# require 'colorize'

module Messages

  def welcome
    prints "Welcome to BATTLESHIP".colorize(:cyan, :bright)
  end

  def options
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?".colorize(:cyan)
  end

  def instructions
    puts "Try and sink all your enemy's ships before they sink all of yours!"
    puts "You won't be able to see the computer's board so you'll have to try and guess where their ships are."
    puts "When all of the squares that your ships occupy are hit, the ship will be sunk."
    puts "The first player who sinks all of their opponents ships wins, and the game ends."
    puts "Would you like to (p)lay or (q)uit game?".colorize(:cyan, :bright)
  end

  def comp_intro
    puts "I have laid out my ships on the grid.
    \nYou now need to layout your two ships.
    \nThe first is two units long and the\nsecond is three units long.
    \nThe grid has A1 at the top left and D4 at the bottom right.
    \nEnter the coordinates for the two unit ship: ".colorize(:magenta)
  end

  def sunkage_comp
    "The machines have won! Just but defintely sunk your ship".colorize(:red)
  end

  def sunkage_player
    "Nice job! You sunk the computer's ship!".colorize(:green)
  end

  def player_miss
    "You fired at #{cell} and missed!".colorize(:red, :bright)
  end

  def order
    "That order structure is not correct".colorize(:red, :bright)
  end

  def cell_full
    "That space is already occupied".colorize(:red, :bright)
  end

  def comp_miss
    "Your enemy fired at #{cell} missed!".colorize(:red, :bright)
  end

  def invalid_coordinates_submit
    "That's not a valid format. Try something like (A1 B2)".colorize(:red, :bright)
  end

  def player_invalid_placement
    "Invalid entry for ship placement, try again: ".colorize(:red, :bright)
  end

  def player_invalid_shot
    "Invalid shot, try again: ".colorize(:red, :bright)
  end

  def invalid_length
    "Your ship is either too long or too short. Try again: ".colorize(:red, :bright)
  end

  def direct_hit(cell)
    "Direct hit at #{cell}!".colorize(:yellow)
  end

  def ask_for_third_ship
    "Now enter the placement coordinates for your long ship: ".colorize(:green)
  end

  def player_turn
    "It's your turn to fire! Enter your selection: ".colorize(:green)
  end

  def player_win
    "You won! Congrats, now go on and do a little dance!".colorize(:magenta)
  end

  def computer_win
    "You lose! This sure is a hit or miss kind of game ;)".colorize(:red, :bright)
  end

  def invalid_selection
    "That wasn't even close to being an option. Try again pal: ".colorize(:red, :bright)
  end

end
