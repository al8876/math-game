class Question
  attr_accessor :num1, :num2, :math_num, :math_string, :answer, :correct

  def initialize()
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @math_num = rand(1..4)
    @math_string = nil
    @correct = nil

    case @math_num
    when 1 then
      @math_string = "plus"
      @answer = num1 + num2
    when 2 then
      @math_string = "minus"
      @answer = num1 - num2
    when 3 then
      @math_string = "times"
      @answer = num1 * num2
    when 4 then
      @math_string = 'divided'
      @answer = num1 / num2
    end

  end

  def ask_question

    puts "What does #{num1} #{math_string} #{num2} equal?"
    
    if gets.chomp.to_i == answer
      puts "YES! Math genius!"
      @correct = true
    else
      puts "Seriously? NO!"
      puts "This answer is: #{answer}"
      @correct = false
    end

  end

  def question_right?

    if @correct == true
      return true
    else
      return false
    end
  end

end