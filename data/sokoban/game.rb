class Game
  attr_accessor :player, :board, :steps

  def initialize(player, board, steps)
    @player, @board, @steps = player, board, steps
  end

  def current_simple_situation_hero_on_empty?(*arguments)
    simple_move? *arguments, :hero_on_empty
  end

  def current_simple_situation_hero_on_goal?(*arguments)
    simple_move? *arguments, :hero_on_goal
  end

  def current_complex_situation_hero_on_empty?(*arguments)
   complex_move? *arguments, :hero_on_empty
  end

  def current_complex_situation_hero_on_goal?(*arguments)
    complex_move? *arguments, :hero_on_goal
  end

  def simple_move_from_empty_field(*arguments)
    simple_move *arguments, :hero_on_empty
  end

  def simple_move_from_goal(*arguments)
    simple_move *arguments, :hero_on_goal
  end

  def complex_move_from_empty_field(*arguments)
    complex_move *arguments, :hero_on_empty
  end

  def complex_move_from_goal(*arguments)
    complex_move *arguments, :hero_on_goal
  end

  def resolve_situation(letter)
    case letter
      when "s" then resolve_situation_down
      when "w" then resolve_situation_up
      when "a" then resolve_situation_left
      when "d" then resolve_situation_right
    else Board.new board.board
    end
  end

private

  def simple_move?(*arguments, hero)
    operation1, operand1, operation2, operand2, next_field = *arguments
    return true if board[[board.send(hero)[0], operand1 ].inject operation1][[board.send(hero)[1], operand2].inject operation2 ] == next_field
  end

  def complex_move?(*arguments, hero)
    operation1, operand1, operation2, operand2, operation3, operand3, operation4, operand4, next_field, next_next_field = *arguments
    return true if board[[board.send(hero)[0], operand1].inject operation1 ][[board.send(hero)[1], operand2].inject operation2 ] == next_field and
      board[[board.send(hero)[0], operand3].inject operation3 ][[board.send(hero)[1], operand4 ].inject operation4 ] == next_next_field
  end

  def simple_move(*arguments, hero)
    operation1, operand1, operation2, operand2, operation3, operand3, operation4, operand4, next_field_changed, current_field = *arguments
    board[[board.send(hero)[0], operand1].inject operation1 ][[board.send(hero)[1], operand2].inject operation2 ] = next_field_changed
    board[[board.send(hero)[0], operand3].inject operation3 ][[board.send(hero)[1], operand4].inject operation4 ] = current_field
    @steps -= 1
    Board.new board.board
  end

  def complex_move(*arguments, hero)
    operation1, operand1, operation2, operand2, operation3, operand3, operation4, operand4, operation5, operand5, operation6, operand6,
      final_next_next_field, final_next_field, current_field = *arguments
    board[[board.send(hero)[0], operand1].inject operation1 ][[board.send(hero)[1], operand2].inject operation2 ] = final_next_next_field
    board[[board.send(hero)[0], operand3].inject operation3 ][[board.send(hero)[1], operand4].inject operation4 ] = final_next_field
    board[[board.send(hero)[0], operand5].inject operation5 ][[board.send(hero)[1], operand6].inject operation6 ] = current_field
    @steps -= 1
    Board.new board.board
  end
end