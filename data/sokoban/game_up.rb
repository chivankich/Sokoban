class Game
  def resolve_situation_up
    if current_simple_situation_hero_on_empty? :-, 1, :+, 0, '3'
      simple_move_from_empty_field :-, 1, :+, 0, :+, 0, :+, 0, '5', ' '
    elsif current_simple_situation_hero_on_empty? :-, 1, :+, 0, ' '
       simple_move_from_empty_field :-, 1, :+, 0, :+, 1, :+, 0, '2', ' '
    elsif current_simple_situation_hero_on_goal? :-, 1, :+, 0, '3'
      simple_move_from_goal :-, 1, :-, 0, :+, 1, :+, 0, '5', '3'
    elsif current_simple_situation_hero_on_goal? :-, 1, :+, 0, ' '
      simple_move_from_goal :-, 1, :-, 0, :+, 0, :+, 0, '2', '3'
    elsif current_complex_situation_hero_on_empty? :-, 1, :+, 0, :-, 2, :+, 0, 'x', '3'
      complex_move_from_empty_field :-, 2, :+, 0, :-, 1, :+, 0, :+, 0, :+, 0, 'x', '5', ' '
    elsif current_complex_situation_hero_on_empty? :-, 1, :+, 0, :-, 2, :+, 0, '4', '3'
      complex_move_from_empty_field :-, 2, :+, 0, :-, 1, :+, 0, :+, 1, :+, 0, 'x', '2', ' '
    elsif current_complex_situation_hero_on_empty? :-, 1, :+, 0, :-, 2, :+, 0, '4', ' '
      complex_move_from_empty_field :-, 2, :+, 0, :-, 1, :+, 0, :+, 1, :+, 0, '4', '2', ' '
    elsif current_complex_situation_hero_on_empty? :-, 1, :+, 0, :-, 2, :+, 0, 'x', ' '
      complex_move_from_empty_field :-, 2, :+, 0, :-, 1, :+, 0, :+, 0, :+, 0, '4', '5', ' '
    elsif current_complex_situation_hero_on_goal? :-, 1, :+, 0, :-, 2, :+, 0, 'x', '3'
      complex_move_from_goal :-, 2, :+, 0, :-, 1, :+, 0, :+, 1, :+, 0, 'x', '5', '3'
    elsif current_complex_situation_hero_on_goal? :-, 1, :+, 0, :-, 2, :+, 0, '4', '3'
      complex_move_from_goal :-, 2, :+, 0, :-, 1, :+, 0, :+, 0, :+, 0, 'x', '2', '3'
    elsif current_complex_situation_hero_on_goal? :-, 1, :+, 0, :-, 2, :+, 0, '4', ' '
      complex_move_from_goal :-, 2, :+, 0, :-, 1, :+, 0, :+, 0, :+, 0, '4', '2', '3'
    elsif current_complex_situation_hero_on_goal? :-, 1, :+, 0, :-, 2, :+, 0, 'x', ' '
      complex_move_from_goal :-, 2, :+, 0, :-, 1, :+, 0, :+, 1, :+, 0, '4', '5', '3'
    else Board.new board.board
    end
  end
end