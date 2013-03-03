module Menu
  def self.start
    system("cls")
    puts "\nHey, you decide to play sokoban! That's great!\n\n"
    begin
      puts "Please, choose a level:\n"
      level = gets.chomp
      if level == "exit"
        puts "\nOoh, common! The game is not even started! :( Bye, Bye...\n"
        exit
      end
    end while level.to_i < 1 or level.to_i > LEVELS.length
    system("cls")
    puts "You choose level #{level}! Good Luck!\n"
    puts "\nOooh! I forgot! What's your name?\n"
    name = gets.chomp
    if name == "exit"
      puts "\nExit is not a name of a good player! :P Bye, Bye...\n"
      exit
    end
    system("cls")
    puts "\nOK, #{name}, now you can start the game!\n\n"
    table = LEVELS[level.to_i - 1].map { |row| row.map { |cell| cell } }
    steps = STEPS[level.to_i - 1]
    board = Board.new(table)
    player = Player.new(name)
    game = Game.new(player, board, steps)
    begin
      puts "Please, press ENTER, #{name}...\n"
      wait_for_enter = gets.chomp
      if wait_for_enter == "exit"
        puts "\nYou will exit just before starting the game!!? OK, ok... Bye, Bye\n"
        exit
      end
    end while not wait_for_enter == ""
    play(game, level)
  end
end