require 'minitest/unit'
require 'sokoban.rb'

class TestBoard < MiniTest::Unit::TestCase
  def test_rows
    board = Board.new([[' ', '2'], ['3', '4']])
    assert_equal board[1], ['3', '4'], "test_rows failed!"
  end

  def test_view_board
    board = Board.new([[' ', '2'], ['3', '4']])
    assert_equal board.view_board, "  2\n3 4\n", "test_view_board failed!"
  end

  def test_hero_on_empty
    board = Board.new([['0', ' ', '0'], [' ', ' ', '2'], [' ', ' ', '0']])
    assert_equal board.hero_on_empty, [1, 2], "test_hero_on_empty failed!"
  end

  def test_hero_on_goal
    board = Board.new([['0', ' ', '0'], [' ', ' ', '0'], [' ', ' ', '5']])
    assert_equal board.hero_on_goal, [2, 2], "test_hero_on_goal failed!"
  end

  def test_end_of_the_level
    board = Board.new([['0', 'x', '0'], [' ', ' ', 'x'], [' ', ' ', 'x']])
    assert_equal board.end?, true, "test_end_of_the_level failed!"
  end

  def test_not_end_of_the_level
    board = Board.new([['0', ' ', '0'], [' ', ' ', 'x'], ['3', ' ', 'x']])
    assert_equal board.end?, false, "test_not_end_of_the_level failed!"
  end
end

class TestPlayer < MiniTest::Unit::TestCase
  def test_player
   player = Player.new("Ivan")
   assert_equal player.name, "Ivan", "test_player failed!"
  end
end

class TestGame < MiniTest::Unit::TestCase
  def test_situation_empty_field_empty_field_down
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '2', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], [' ', ' ', ' '], ['0', '2', '0']])
    assert_equal game.simple_move_from_empty_field(:+, 1, :+, 0, :+, 0, :+, 0, '2', ' '), next_board, "test_situation_empty_field_empty_field_down failed!"
  end

  def test_situation_empty_field_empty_field_up
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '2', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', '2', '0'], [' ', ' ', ' '], ['0', ' ', '0']])
    assert_equal game.simple_move_from_empty_field(:-, 1, :+, 0, :+, 1, :+, 0, '2', ' '), next_board, "test_situation_empty_field_empty_field_up failed!"
  end

  def test_situation_empty_field_empty_field_left
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '2', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], ['2', ' ', ' '], ['0', ' ', '0']])
    assert_equal game.simple_move_from_empty_field(:-, 0, :-, 1, :+, 0, :+, 1, '2', ' '), next_board, "test_situation_empty_field_empty_field_left failed!"
  end

  def test_situation_empty_field_empty_field_right
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '2', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], [' ', ' ', '2'], ['0', ' ', '0']])
    assert_equal game.simple_move_from_empty_field(:-, 0, :+, 1, :+, 0, :+, 0, '2', ' '), next_board, "test_situation_empty_field_empty_field_right failed!"
  end

  def test_situation_empty_field_goal_down
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '2', ' '], ['0', '3', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], [' ', ' ', ' '], ['0', '5', '0']])
    assert_equal game.simple_move_from_empty_field(:+, 1, :+, 0, :+, 0, :+, 0, '5', ' '), next_board, "test_situation_empty_field_goal_down failed!"
  end

  def test_situation_empty_field_goal_up
    player = Player.new("Ivan")
    board = Board.new([['0', '3', '0'], [' ', '2', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', '5', '0'], [' ', ' ', ' '], ['0', ' ', '0']])
    assert_equal game.simple_move_from_empty_field(:-, 1, :+, 0, :+, 0, :+, 0, '5', ' '), next_board, "test_situation_empty_field_goal_up failed!"
  end

  def test_situation_empty_field_goal_left
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], ['3', '2', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], ['5', ' ', ' '], ['0', ' ', '0']])
    assert_equal game.simple_move_from_empty_field(:-, 0, :-, 1, :+, 0, :+, 0, '5', ' '), next_board, "test_situation_empty_field_goal_left failed!"
  end

  def test_situation_empty_field_goal_right
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '2', '3'], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], [' ', ' ', '5'], ['0', ' ', '0']])
    assert_equal game.simple_move_from_empty_field(:-, 0, :+, 1, :+, 0, :+, 0, '5', ' '), next_board, "test_situation_empty_field_goal_right failed!"
  end

  def test_situation_goal_empty_field_down
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '5', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], [' ', '3', ' '], ['0', '2', '0']])
    assert_equal game.simple_move_from_goal(:+, 1, :+, 0, :+, 0, :+, 0, '2', '3'), next_board, "test_situation_goal_empty_field_down failed!"
  end

  def test_situation_goal_empty_field_up
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '5', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', '2', '0'], [' ', '3', ' '], ['0', ' ', '0']])
    assert_equal game.simple_move_from_goal(:-, 1, :-, 0, :+, 0, :+, 0, '2', '3'), next_board, "test_situation_goal_empty_field_up failed!"
  end

  def test_situation_goal_empty_field_left
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '5', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], ['2', '3', ' '], ['0', ' ', '0']])
    assert_equal game.simple_move_from_goal(:-, 0, :-, 1, :+, 0, :+, 0, '2', '3'), next_board, "test_situation_goal_empty_field_left failed!"
  end

  def test_situation_goal_empty_field_right
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '5', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], [' ', '3', '2'], ['0', ' ', '0']])
    assert_equal game.simple_move_from_goal(:-, 0, :+, 1, :+, 0, :+, 0, '2', '3'), next_board, "test_situation_goal_empty_field_rigt failed!"
  end

  def test_situation_goal_goal_down
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '5', ' '], ['0', '3', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], [' ', '3', ' '], ['0', '5', '0']])
    assert_equal game.simple_move_from_goal(:+, 1, :+, 0, :+, 0, :+, 0, '5', '3'), next_board, "test_situation_goal_goal_down failed!"
  end

  def test_situation_goal_goal_up
    player = Player.new("Ivan")
    board = Board.new([['0', '3', '0'], [' ', '5', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', '5', '0'], [' ', '3', ' '], ['0', ' ', '0']])
    assert_equal game.simple_move_from_goal(:-, 1, :-, 0, :+, 1, :+, 0, '5', '3'), next_board, "test_situation_goal_goal_up failed!"
  end

  def test_situation_goal_goal_left
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], ['3', '5', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], ['5', '3', ' '], ['0', ' ', '0']])
    assert_equal game.simple_move_from_goal(:-, 0, :-, 1, :+, 0, :+, 1, '5', '3'), next_board, "test_situation_goal_goal_left failed!"
  end

  def test_situation_goal_goal_right
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '5', '3'], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], [' ', '3', '5'], ['0', ' ', '0']])
    assert_equal game.simple_move_from_goal(:-, 0, :+, 1, :+, 0, :+, 0, '5', '3'), next_board, "test_situation_goal_goal_right failed!"
  end

  def test_situation_empty_field_box_on_goal_goal_down
    player = Player.new("Ivan")
    board = Board.new([['0', '2', '0'], [' ', 'x', ' '], ['0', '3', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], [' ', '5', ' '], ['0', 'x', '0']])
    assert_equal game.complex_move_from_empty_field(:+, 2, :+, 0, :+, 1, :+, 0, :+, 0, :+, 0, 'x', '5', ' '), next_board,
      "test_situation_empty_field_box_on_goal_goal_down failed!"
  end

  def test_situation_empty_field_box_goal_up
    player = Player.new("Ivan")
    board = Board.new([['0', '3', '0'], [' ', '4', ' '], ['0', '2', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', 'x', '0'], [' ', '2', ' '], ['0', ' ', '0']])
    assert_equal game.complex_move_from_empty_field(:-, 2, :+, 0, :-, 1, :+, 0, :+, 1, :+, 0, 'x', '2', ' '), next_board,
      "test_situation_empty_field_box_goal_up failed!"
  end

  def test_situation_empty_field_box_empty_field_left
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '4', '2'], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], ['4', '2', ' '], ['0', ' ', '0']])
    assert_equal game.complex_move_from_empty_field(:-, 0, :-, 2, :-, 0, :-, 1, :+, 0, :+, 1, '4', '2', ' '), next_board,
      "test_situation_empty_field_box_empty_field_left failed!"
  end

  def test_situation_empty_field_box_on_goal_empty_field_right
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], ['2', 'x', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], [' ', '5', '4'], ['0', ' ', '0']])
    assert_equal game.complex_move_from_empty_field(:-, 0, :+, 2, :-, 0, :+, 1, :+, 0, :+, 0, '4', '5', ' '), next_board,
      "test_situation_empty_field_box_on_goal_empty_field_right failed!"
  end

  def test_situation_goal_box_on_goal_goal_down
    player = Player.new("Ivan")
    board = Board.new([['0', '5', '0'], [' ', 'x', ' '], ['0', '3', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', '3', '0'], [' ', '5', ' '], ['0', 'x', '0']])
    assert_equal game.complex_move_from_goal(:+, 2, :+, 0, :+, 1, :+, 0, :+, 0, :+, 0, 'x', '5', '3'), next_board,
      "test_situation_goal_box_on_goal_goal_down failed!"
  end

  def test_situation_goal_box_goal_up
    player = Player.new("Ivan")
    board = Board.new([['0', '3', '0'], [' ', '4', ' '], ['0', '5', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', 'x', '0'], [' ', '2', ' '], ['0', '3', '0']])
    assert_equal game.complex_move_from_goal(:-, 2, :+, 0, :-, 1, :+, 0, :+, 0, :+, 0, 'x', '2', '3'), next_board,
      "test_situation_goal_box_goal_up failed!"
  end

  def test_situation_goal_box_empty_field_left
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '4', '5'], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], ['4', '2', '3'], ['0', ' ', '0']])
    assert_equal game.complex_move_from_goal(:-, 0, :-, 2, :-, 0, :-, 1, :+, 0, :+, 0, '4', '2', '3'), next_board,
      "test_situation_goal_box_empty_field_left failed!"
  end

  def test_situation_goal_box_on_goal_empty_field_right
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], ['5', 'x', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    next_board = Board.new([['0', ' ', '0'], ['3', '5', '4'], ['0', ' ', '0']])
    assert_equal game.complex_move_from_goal(:-, 0, :+, 2, :-, 0, :+, 1, :+, 0, :+, 0, '4', '5', '3'), next_board,
      "test_situation_goal_box_on_goal_empty_field_right failed!"
  end

  def test_check_for_empty_field
    player = Player.new("Ivan")
    board = Board.new([['0', ' ', '0'], [' ', '2', ' '], ['0', ' ', '0']])
    game = Game.new(player, board, 100)
    assert_equal game.current_simple_situation_hero_on_empty?(:+, 1, :+, 0, ' '), true
    assert_equal game.current_simple_situation_hero_on_empty?(:-, 1, :+, 0, ' '), true
    assert_equal game.current_simple_situation_hero_on_empty?(:-, 0, :-, 1, ' '), true
    assert_equal game.current_simple_situation_hero_on_empty?(:-, 0, :+, 1, ' '), true
  end

  def test_check_for_goal
    player = Player.new("Ivan")
    board = Board.new([['0', '3', '0'], ['3', '2', '3'], ['0', '3', '0']])
    game = Game.new(player, board, 100)
    assert_equal game.current_simple_situation_hero_on_empty?(:+, 1, :+, 0, '3'), true
    assert_equal game.current_simple_situation_hero_on_empty?(:-, 1, :+, 0, '3'), true
    assert_equal game.current_simple_situation_hero_on_empty?(:-, 0, :-, 1, '3'), true
    assert_equal game.current_simple_situation_hero_on_empty?(:-, 0, :+, 1, '3'), true
  end

  def test_check_for_box_empty_field
    player = Player.new("Ivan")
    board = Board.new([['0', '0', ' ', '0', '0'], ['0', '0', '4', '0', '0'], [' ', '4', '2', '4', ' '], ['0', '0', '4', '0', '0'], ['0', '0', ' ', '0', '0']])
    game = Game.new(player, board, 100)
    assert_equal game.current_complex_situation_hero_on_empty?(:+, 1, :+, 0, :+, 2, :+, 0, '4', ' '), true
    assert_equal game.current_complex_situation_hero_on_empty?(:-, 1, :+, 0, :-, 2, :+, 0, '4', ' '), true
    assert_equal game.current_complex_situation_hero_on_empty?(:-, 0, :-, 1, :-, 0, :-, 2, '4', ' '), true
    assert_equal game.current_complex_situation_hero_on_empty?(:-, 0, :+, 1, :-, 0, :+, 2, '4', ' '), true
  end


  def test_check_for_box_goal
    player = Player.new("Ivan")
    board = Board.new([['0', '0', '3', '0', '0'], ['0', '0', '4', '0', '0'], ['3', '4', '2', '4', '3'], ['0', '0', '4', '0', '0'], ['0', '0', '3', '0', '0']])
    game = Game.new(player, board, 100)
    assert_equal game.current_complex_situation_hero_on_empty?(:+, 1, :+, 0, :+, 2, :+, 0, '4', '3'), true
    assert_equal game.current_complex_situation_hero_on_empty?(:-, 1, :+, 0, :-, 2, :+, 0, '4', '3'), true
    assert_equal game.current_complex_situation_hero_on_empty?(:-, 0, :-, 1, :-, 0, :-, 2, '4', '3'), true
    assert_equal game.current_complex_situation_hero_on_empty?(:-, 0, :+, 1, :-, 0, :+, 2, '4', '3'), true
  end

  def test_check_for_box_on_goal_goal
    player = Player.new("Ivan")
    board = Board.new([['0', '0', '3', '0', '0'], ['0', '0', 'x', '0', '0'], ['3', 'x', '5', 'x', '3'], ['0', '0', 'x', '0', '0'], ['0', '0', '3', '0', '0']])
    game = Game.new(player, board, 100)
    assert_equal game.current_complex_situation_hero_on_goal?(:+, 1, :+, 0, :+, 2, :+, 0, 'x', '3'), true
    assert_equal game.current_complex_situation_hero_on_goal?(:-, 1, :+, 0, :-, 2, :+, 0, 'x', '3'), true
    assert_equal game.current_complex_situation_hero_on_goal?(:-, 0, :-, 1, :-, 0, :-, 2, 'x', '3'), true
    assert_equal game.current_complex_situation_hero_on_goal?(:-, 0, :+, 1, :-, 0, :+, 2, 'x', '3'), true
  end

  def test_check_for_box_on_goal_empty
    player = Player.new("Ivan")
    board = Board.new([['0', '0', ' ', '0', '0'], ['0', '0', 'x', '0', '0'], [' ', 'x', '5', 'x', ' '], ['0', '0', 'x', '0', '0'], ['0', '0', ' ', '0', '0']])
    game = Game.new(player, board, 100)
    assert_equal game.current_complex_situation_hero_on_goal?(:+, 1, :+, 0, :+, 2, :+, 0, 'x', ' '), true
    assert_equal game.current_complex_situation_hero_on_goal?(:-, 1, :+, 0, :-, 2, :+, 0, 'x', ' '), true
    assert_equal game.current_complex_situation_hero_on_goal?(:-, 0, :-, 1, :-, 0, :-, 2, 'x', ' '), true
    assert_equal game.current_complex_situation_hero_on_goal?(:-, 0, :+, 1, :-, 0, :+, 2, 'x', ' '), true
  end

  def test_resolve_situation_no_way
    player = Player.new("Ivan")
    board = Board.new([['0', '0', '0'], ['0', '5', '0'], ['0', '0', '0']])
    game = Game.new(player, board, 100)
    assert_equal game.resolve_situation("w"), board
    assert_equal game.resolve_situation("s"), board
    assert_equal game.resolve_situation("a"), board
    assert_equal game.resolve_situation("d"), board
  end
end
