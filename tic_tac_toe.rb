class TicTacToe
  def initialize
    @board = Array.new(3) {Array.new(3, " ")}
    @turns_played = 0
    @current_row = 0
    @current_col = 0
    @current_turn = ["O", "X"].sample
    @winner = nil
  end

  def display_board
    puts "The final board - draw:" if @winner == nil
    puts "The final board:" if @winner !=nil
    p @board[0]
    p @board[1]
    p @board[2]
    true
  end

  def turn_toggle
    return "O" if @current_turn == "X"
    return "X" if @current_turn == "O"
  end

  def play_turn
    current_row = rand(0..2)
    current_col = rand(0..2)
    while @board[current_row][current_col] != " "
      current_row = rand(0..2)
      current_col = rand(0..2)
    end
    @board[current_row][current_col] = @current_turn
    @current_turn = turn_toggle
    @turns_played += 1
  end



  def game_over? ## Determines if the game is over
    final_result = nil
    search_index = 0
    # Check row win
    @board.any? do  |row|
      @winner = ["X"] if row.uniq == ["X"]
      @winner = ["O"] if row.uniq == ["O"]
    end
    # Check column win
    @board.transpose.any? do  |col|
      @winner = ["X"] if col.uniq == ["X"]
      @winner = ["O"] if col.uniq == ["O"]
    end

    # Check diagonal win - main diagonal
    @winner = ["X"] if [@board[0][0], @board[1][1], @board[2][2]].uniq == ["X"]
    @winner = ["O"] if [@board[0][0], @board[1][1], @board[2][2]].uniq == ["O"]
    # Check diagonal win - reverse diagonal
    @winner = ["X"] if [@board[0][-1], @board[1][-2], @board[2][-3]].uniq == ["X"]
    @winner = ["O"] if [@board[0][-1], @board[1][-2], @board[2][-3]].uniq == ["O"]


    if @winner == nil && @turns_played == 9
      p "Draw!"
      return true
    end

    if @winner != nil
      p "After #{@turns_played} grueling rounds of tic-tac-toe, the winner is #{@winner[0]}"
      return true
    end

  end

end

### DRIVER TEST CODE

def play_round
  test = TicTacToe.new()
  until test.game_over?
    test.play_turn
  end
  test.display_board
end

play_round