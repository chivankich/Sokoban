module Menu
  def self.play(game, level)
    system("cls")
    puts "\nLevel #{level}".ljust(12) + "Restart the level: RESTART\n".rjust(40)
    puts "Exit the game:     EXIT\n".rjust(48)
    puts game.board.view_board
    if game.board.end?
      puts "\nCongratulations, #{game.player.name}! You win! :)\n"
      begin
        puts "\nPlease, press ENTER, #{game.player.name}...\n"
        wait_for_enter = gets.chomp
      end while not wait_for_enter == ""
      suggestion(game.player.name)
    end
    if game.steps < 0
      puts "\nSorry #{game.player.name}, you lose the game! :(\n"
      begin
        puts "\nPlease, press ENTER, #{game.player.name}...\n"
        wait_for_enter = gets.chomp
      end while not wait_for_enter == ""
      suggestion(game.player.name)
    end
    puts "\n(#{game.steps} steps remaining) Please enter your next move, #{game.player.name}: "
    next_move = gets.chomp
    if next_move == "exit"
      puts "\nYou choose to quit the game!\n"
      begin
        puts "\nPlease, press ENTER, #{game.player.name}...\n"
        wait_for_enter = gets.chomp
      end while not wait_for_enter == ""
      suggestion(game.player.name)
    elsif next_move == "restart"
      puts "\nYou choose to restart the level, #{game.player.name}!\n\n"
      table = LEVELS[level.to_i - 1].map { |row| row.map { |cell| cell }  }
      steps = STEPS[level.to_i - 1]
      board = Board.new(table)
      player = Player.new(game.player.name)
      game = Game.new(player, board, steps)
      begin
        puts "\nPlease, press ENTER, #{game.player.name}...\n"
        wait_for_enter = gets.chomp
        if wait_for_enter == "exit"
          puts "\nEh... thanks for playing, #{game.player.name}! Better luck next time! :)\n"
          exit
        end
      end while not wait_for_enter == ""
      play(game, level)
    end
    letter = next_move[0]
    next_board = game.resolve_situation(letter)
    game = Game.new(game.player, next_board, game.steps)
    play(game, level)
  end
end