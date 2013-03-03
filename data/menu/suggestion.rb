module Menu
  def self.suggestion(name)
    system("cls")
    begin
      puts "\nWould you like to play more, #{name}? (y/n)\n"
      answer = gets.chomp
    end while not (answer == "n" or answer == "y")
    if answer == "n"
      puts "\nI hope the game brought you joy!^^ Have a nice day, #{name}! :)\n"
      exit
    else
      begin
        puts "OK, that's great! Please choose a level:\n"
        level = gets.chomp
        if level == "exit"
          puts "\nEh... thanks for playing #{name}! Better luck next time! :)\n"
          exit
        end
      end while level.to_i < 1 or level.to_i > LEVELS.length
      system("cls")
      puts "\nYou choose level #{level}! Good Luck!\n"
      puts "\nOK, #{name}, now you can start the game once again!\n\n"
      table = LEVELS[level.to_i - 1].map { |row| row.map { |cell| cell } }
      steps = STEPS[level.to_i - 1]
      board = Board.new(table)
      player = Player.new(name)
      game = Game.new(player, board, steps)
      begin
        puts "Please, press ENTER, #{name}...\n"
        wait_for_enter = gets.chomp
        if wait_for_enter == "exit"
          puts "\nAufwiedersehn! :)\n"
          exit
        end
      end while not wait_for_enter == ""
      play(game, level)
    end
  end
end