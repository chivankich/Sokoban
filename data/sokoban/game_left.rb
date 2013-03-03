class Game
  def resolve_situation_left
    if current_simple_situation_hero_on_empty? :-, 0, :-, 1, '3'
      simple_move_from_empty_field :-, 0, :-, 1, :+, 0, :+, 0, '5', ' '
    elsif current_simple_situation_hero_on_empty? :-, 0, :-, 1, ' '
      simple_move_from_empty_field :-, 0, :-, 1, :+, 0, :+, 1, '2', ' '
    elsif current_simple_situation_hero_on_goal? :-, 0, :-, 1, '3'
      simple_move_from_goal :-, 0, :-, 1, :+, 0, :+, 1, '5', '3'
    elsif current_simple_situation_hero_on_goal? :-, 0, :-, 1, ' '
       simple_move_from_goal :-, 0, :-, 1, :+, 0, :+, 0, '2', '3'
    elsif current_complex_situation_hero_on_empty? :-, 0, :-, 1, :-, 0, :-, 2, 'x', '3'
      complex_move_from_empty_field :-, 0, :-, 2, :-, 0, :-, 1, :+, 0, :+, 0, 'x', '5', ' '
    elsif current_complex_situation_hero_on_empty? :-, 0, :-, 1, :-, 0, :-, 2, '4', '3'
      complex_move_from_empty_field :-, 0, :-, 2, :-, 0, :-, 1, :+, 0, :+, 1, 'x', '2', ' '
    elsif current_complex_situation_hero_on_empty? :-, 0, :-, 1, :-, 0, :-, 2, '4', ' '
      complex_move_from_empty_field :-, 0, :-, 2, :-, 0, :-, 1, :+, 0, :+, 1, '4', '2', ' '
    elsif current_complex_situation_hero_on_empty? :-, 0, :-, 1, :-, 0, :-, 2, 'x', ' '
      complex_move_from_empty_field :-, 0, :-, 2, :-, 0, :-, 1, :+, 0, :+, 0, '4', '5', ' '
    elsif current_complex_situation_hero_on_goal? :-, 0, :-, 1, :-, 0, :-, 2, 'x', '3'
      complex_move_from_goal :-, 0, :-, 2, :-, 0, :-, 1, :+, 0, :+, 1, 'x', '5', '3'
    elsif current_complex_situation_hero_on_goal? :-, 0, :-, 1, :-, 0, :-, 2, '4', '3'
      complex_move_from_goal :-, 0, :-, 2, :-, 0, :-, 1, :+, 0, :+, 0, 'x', '2', '3'
    elsif current_complex_situation_hero_on_goal? :-, 0, :-, 1, :-, 0, :-, 2, '4', ' '
      complex_move_from_goal :-, 0, :-, 2, :-, 0, :-, 1, :+, 0, :+, 0, '4', '2', '3'
    elsif current_complex_situation_hero_on_goal? :-, 0, :-, 1, :-, 0, :-, 2, 'x', ' '
      complex_move_from_goal :-, 0, :-, 2, :-, 0, :-, 1, :+, 0, :+, 1, '4', '5', '3'
    else Board.new board.board
    end
  end
end