require 'tk'
require 'tkextlib/tile'
require './levels.rb'
require './sokoban.rb'
require './graphic_user_interface/menu_gui.rb'
require './graphic_user_interface/correct_level_gui.rb'
require './graphic_user_interface/play_gui.rb'

Menu.start
Tk.mainloop()