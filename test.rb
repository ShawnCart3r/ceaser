class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
    @current_player = "X"
  end

  def play
    until game_over?
      display_board
      player_move
      switch_player
    end
    display_board
    announce_result
  end

  private

  def display_board
    puts "\n  0   1   2"
    @board.each_with_index do |row, i|
      puts "#{i} #{row.join(" | ")}"
      puts "  ---------" unless i == 2
    end
    puts
  end

  def player_move
    loop do
      print "#{@current_player}, enter row and column (e.g., 1 2): "
      input = gets.chomp.split.map(&:to_i)

      if valid_move?(input)
        @board[input[0]][input[1]] = @current_player
        break
      else
        puts "Invalid move. Try again!"
      end
    end
  end

  def valid_move?(input)
    return false unless input.length == 2
    row, col = input
    return false unless row.between?(0, 2) && col.between?(0, 2)
    return false unless @board[row][col] == " "

    true
  end

  def switch_player
    @current_player = @current_player == "X" ? "O" : "X"
  end

  def game_over?
    winner? || draw?
  end

  def winner?
    winning_lines.any? { |line| line.uniq.length == 1 && line.first != " " }
  end

  def draw?
    @board.flatten.none? { |cell| cell == " " }
  end

  def winning_lines
    rows = @board
    cols = @board.transpose
    diagonals = [[@board[0][0], @board[1][1], @board[2][2]], [@board[0][2], @board[1][1], @board[2][0]]]
    rows + cols + diagonals
  end

  def announce_result
    if winner?
      switch_player  # Switch back to the winning player
      puts "Congratulations, #{@current_player} wins!"
    else
      puts "It's a draw!"
    end
  end
end

# Start the game
TicTacToe.new.play
