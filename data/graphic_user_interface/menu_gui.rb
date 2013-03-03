module Menu
  def self.start
    opening = TkRoot.new { title "Sokoban" }
    opening_frame = Tk::Tile::Frame.new(opening) { padding "3 3 12 12" }.grid(:sticky => 'nsew')
    message = Tk::Tile::Label.new(opening_frame) { text "Please, select a level! (1-10) " }.grid(:column => 1, :row => 1, :sticky => 'ne')
    $answer = TkVariable.new
    entry = Tk::Tile::Entry.new(opening_frame) { width 3
      textvariable $answer }.grid(:column => 2, :row => 1, :sticky => 'ne')
    entry.focus
    button_begin = Tk::Tile::Button.new(opening_frame) { text "Begin the game!"
      command { Menu::correct_entry? $answer, opening }}.grid(:column => 1, :row => 2)
    button_exit = Tk::Tile::Button.new(opening_frame) { text "Exit"
      command { opening.destroy } }.grid(:column => 2, :row => 2)
  end
end