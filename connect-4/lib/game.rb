require_relative "board"
require_relative "player"

puts "Welcome to Four-Board!\n"

##Player 1 validate & initialize
name = ""
char = ""
while name == ""
  print "Enter Player1 Name: "
  name = gets.chomp
  if name == ""
    puts "ERROR: Name required\n\n"
  end
end

while char == "" || char.length > 1
  print "Enter Chosen Character (single letter or number): "
  char = gets.chomp
  if char == ""
    puts "ERROR: Character required\n\n"
  end
  if char.length > 1
    puts "ERROR: One character only\n\n"
  end
end

player1 = Player.new(name, char)


#Player2 validate & initialize
name = ""
char = ""
while name == "" || name == player1.name
  print "\nEnter Player2 Name: "
  name = gets.chomp
  if name == ""
    puts "ERROR: Name required\n"
  end
  if name == player1.name
    puts "ERROR: Cannot be same name as Player1 (#{player1.name})\n"
  end
end

while char == "" || char.length > 1 || char == player1.character
  print "Enter Chosen Character (single letter or number): "
  char = gets.chomp

  if char == ""
    puts "ERROR: Character required\n\n"
  elsif char.length > 1
    puts "ERROR: One character only\n\n"
  elsif char == player1.character
    puts "ERROR: Cannot be same character as Player1 (#{player1.character})\n\n"
  end
end

player2 = Player.new(name, char)

puts "\n\n"
puts "#{player1.name} will play as #{player1.character}\n"
puts "#{player2.name} will play as #{player2.character}\n"
puts "LET's PLAY!"
puts "\n\n"

board = Board.new
puts board.display
game = "on"
current_player = player1

while game == "on"
  moveCol = ""
  while !board.grid[-1].include?(moveCol)
    print "\n#{current_player.name}, select the column you would like for your turn"
    moveCol = gets.chomp.upcase
    if !board.grid[-1].include?(moveCol)
      puts "ERROR: Invalid Entry"
    end
  end
  board.move(current_player, board.grid[-1].index(moveCol))
  puts "\n\n"
  puts board.display
  puts "\n\n"
  if current_player == player1
    current_player = player2
  else
    current_player = player1
  end
end
