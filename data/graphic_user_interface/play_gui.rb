module Menu
  def self.play(game, level, root, current_root)
    if game.board.end?
      final_window = TkToplevel.new(root) { title "Sokoban" }
      final_label = Tk::Tile::Label.new(final_window) { text "Congratulations! You win!" }.grid(:column => 2, :row => 2)
      final_button = Tk::Tile::Button.new(final_window) { text "OK"
        command {
          final_window.destroy
          current_root.destroy} }.grid(:column => 2, :row => 3)
    end
    if game.steps < 0
      final_window = TkToplevel.new(root) { title "Sokoban" }
      final_label = Tk::Tile::Label.new(final_window) { text "I'm sorry! You lose! :(" }.grid(:column => 2, :row => 2)
      final_button = Tk::Tile::Button.new(final_window) { text "OK"
        command {
          final_window.destroy
          current_root.destroy} }.grid(:column => 2, :row => 3)
    end
    playing_frame = Tk::Tile::Frame.new(current_root) { padding "3 3 3 3" }.grid(:column => 1, :row => 6, :sticky => 'nsew')
    user_frame = Tk::Tile::Frame.new(current_root) { padding "3 3 3 3" }.grid(:column => 2, :row => 6, :sticky => 'nsew')
    playing_frame['relief'] = 'raised'
    restart_buton = Tk::Tile::Button.new(user_frame) { text "Restart"
      command {
        table = LEVELS[level.to_i - 1].map { |row| row.map { |cell| cell } }
        steps = STEPS[level.to_i - 1]
        board = Board.new(table)
        player = Player.new("Player")
        game = Game.new(player, board, steps)
        Menu::play(game, level, root, current_root)} }.grid(:column => 3, :row => 7)
    exit_button = Tk::Tile::Button.new(user_frame) { text "Exit"
      command {current_root.destroy}}.grid(:column => 3, :row => 8)
    steps_counter = Tk::Tile::Label.new(user_frame) { text "#{game.steps} steps remaining!" }.grid(:column => 3, :row => 9)
    message = Tk::Tile::Label.new(user_frame) { text "Please, enter your next move!" }.grid(:column => 3, :row => 1)
    button_up = Tk::Tile::Button.new(user_frame) { text "Up"
      command {
        next_board = game.resolve_situation('w')
        game = Game.new(game.player, next_board, game.steps)
        playing_frame.destroy
        Menu::play(game, level, root, current_root) }}.grid(:column => 3, :row => 3)
    button_down = Tk::Tile::Button.new(user_frame) { text "Down"
      command {
        next_board = game.resolve_situation('s')
        game = Game.new(game.player, next_board, game.steps)
        playing_frame.destroy
        Menu::play(game, level, root, current_root) }}.grid(:column => 3, :row => 5)
    button_left = Tk::Tile::Button.new(user_frame) { text "Left"
      command {
        next_board = game.resolve_situation('a')
        game = Game.new(game.player, next_board, game.steps)
        playing_frame.destroy
        Menu::play(game, level, root, current_root) }}.grid(:column => 2, :row => 4)
    button_right = Tk::Tile::Button.new(user_frame) { text "Right"
      command {
        next_board = game.resolve_situation('d')
        game = Game.new(game.player, next_board, game.steps)
        playing_frame.destroy
        Menu::play(game, level, root, current_root) }}.grid(:column => 4, :row => 4)
    0.upto(game.board.rows - 1) do |row|
      0.upto(game.board.columns - 1) do |column|
        if game.board[row][column] == '0'
          wall = TkPhotoImage.new(:file => 'images/wall.gif')
          label_wall = Tk::Tile::Label.new(playing_frame) { image wall }.grid(:column => column + 1, :row => row + 1)
        elsif game.board[row][column] == '4'
          box = TkPhotoImage.new(:file => 'images/box.gif')
          label_box = Tk::Tile::Label.new(playing_frame) { image box }.grid(:column => column + 1, :row => row + 1)
        elsif game.board[row][column] == '3'
          box_goal = TkPhotoImage.new(:file => 'images/box_goal.gif')
          label_box_goal = Tk::Tile::Label.new(playing_frame) { image box_goal }.grid(:column => column + 1, :row => row + 1)
        elsif game.board[row][column] == 'x'
          other_box = TkPhotoImage.new(:file => 'images/other_box.gif')
          label_other_box = Tk::Tile::Label.new(playing_frame) { image other_box }.grid(:column => column + 1, :row => row + 1)
        elsif game.board[row][column] == '2' or game.board[row][column] == '5'
          hero = TkPhotoImage.new(:file => 'images/hero.gif')
          label_hero = Tk::Tile::Label.new(playing_frame) { image hero }.grid(:column => column + 1, :row => row + 1)
        else
          label = Tk::Tile::Label.new(playing_frame) { text "#{game.board[row][column]}" }.grid(:column => column + 1, :row => row + 1)
        end
      end
    end
  end
end