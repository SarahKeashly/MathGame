require "./players"

class Match
  attr_accessor :winner, :turn, :player1, :player2, :current_player, :answer, :choice

  def initialize(player1, player2)
   @player1 = player1
   @player2 = player2
   @winner = false
   @turn = @player1.handle
   @current_player = @player1.handle
   @answer = 0
   @choice = 0
  end


  def start_game
    puts "Here is the start of the game"
    puts "#{@player1.handle} #{@player1.score}/3 vs. #{@player2.handle} #{@player2.score}/3"
    puts "#{@current_player} you go first"
      while @player1.score > 0 && @player2.score > 0
        puts "Now it's #{@current_player}'s turn"
          ask_question()
          correct()
          switch_player()
      end
      game_over()
  end

##-----Methods-----##
  def ask_question
    ## MATH LOGIC ##
    a = rand(1..20)
    b = rand(1..20)
    @answer = (a + b).to_s
    puts "What is #{a} + #{b}?"
    @choice = $stdin.gets.chomp.to_s
  end
    
   
    def correct
      if @choice == @answer
        puts "You are right! #{@answer} is the correct answer."
        puts "Good job, your score is still #{@current_player == @player1.handle ? @player1.score : @player2.score}/3!" 
      else
          @current_player == @player1.handle ? @player1.score -= 1 : @player2.score -= 1
          puts "You're wrong, your score has decreased to #{@current_player == @player1.handle ? @player1.score : @player2.score}/3!"
      end
    end

    def switch_player
      if @current_player == @player1.handle
        @current_player = @player2.handle
      else
        @current_player = @player1.handle
      end
    end


def game_over
  puts "#{@current_player} wins!"
end
end

puts player1 = Player.new("Player 1")
puts player2 = Player.new("Player 2")
puts newGame = Match.new(player1, player2)
# puts newGame.player1.handle
newGame.start_game()