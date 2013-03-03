class Board
  attr_accessor :board, :rows, :columns

  def initialize(board)
    @board = board
    @rows = board.length
    @columns = board[0].length
  end

  def ==(other_board)
    @board == other_board.board
  end

  def [](number)
    @board[number]
  end

  def view_board
    table = ""
    b = @board.map { |row| row.join ' '}
    b.each do |row|
      table = table + row + "\n"
    end
    table
  end

  def hero_on_empty
    0.upto(@rows - 1) { |row| if @board[row].include? '2' then return [row, @board[row].index('2')] end }
  end

  def hero_on_goal
    0.upto(@rows - 1) { |row| if @board[row].include? '5' then return [row, @board[row].index('5')] end }
  end

  def end?
    0.upto(@rows - 1) { |row| if @board[row].include? '3' or @board[row].include? '5'  then return false end }
    true
  end
end