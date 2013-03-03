module Menu
  def self.correct_entry?(level, root)
    if level < 1 or level > 10 then Tk::messageBox :title => 'Error', :icon => 'error', :message => 'Your choice is not valid!'
    else
      table = LEVELS[level.to_i - 1].map { |row| row.map { |cell| cell } }
      steps = STEPS[level.to_i - 1]
      board = Board.new(table)
      player = Player.new("Player")
      game = Game.new(player, board, steps)
      playing_window = TkToplevel.new(root) { title "Sokoban (LEVEL #{level})" }
      play(game, level, root, playing_window)
    end
  end
end