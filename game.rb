class Game
  attr_accessor :start, :user_turn

  def initialize()
    @start = true
    @user_turn = 0
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
  end

  def start_game

    puts "--- Game Starting ---"
    
    while @start
      
      if @user_turn == 0
        puts "--- New TURN ---"
        puts "Player 1 step up"
        question_1 = Question.new()
        question_1.ask_question
        
        if question_1.question_right?
          @user_turn = 1
        else
          @player_1.loose_life
          @user_turn = 1
        end
        puts "P1: #{@player_1.life}/3 vs P2 #{@player_2.life}/3"
      end

      if @user_turn == 1
        puts "--- New Turn ---"
        puts "Player 2 step up"
        question_2 = Question.new()
        question_2.ask_question

        if question_2.question_right?
          @user_turn = 0
        else
          @user_turn = 0
          @player_2.loose_life
        end
        puts "P1: #{@player_1.life}/3 vs P2 #{@player_2.life}/3"
      end
      
      if @player_1.life == 0 || @player_2.life == 0
        @start = false
        if @player_1.life > @player_2.life
          puts "Player 1 wins with a score of #{@player_1.life}/3"
        else
          puts "Player 2 wins with a score of #{@player_2.life}/3"
        end
      end

    end

    puts "--- GAME OVER ---"
    puts "Good bye!"

  end
end