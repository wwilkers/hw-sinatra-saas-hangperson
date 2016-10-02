class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.
  #Wyatt still thinks that he deleted this comment. What he doesnt know is that I retyped it. :^)
  # Get a word from remote "random word" service
  

  # def initialize()
  # end
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  def initialize(new_word)
    @word = new_word
    @guesses = ''
    @wrong_guesses = ''
    
   #until mystryword.length = word.length do
    #  mystryword << '-'
   # end
   
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
def guess(letter)
  raise ArgumentError if letter.nil?
  raise ArgumentError if letter.empty?
  raise ArgumentError if !letter.match(/[a-zA-Z]/)
 
    letter.downcase!
    if (@guesses.include? letter) || (@wrong_guesses.include? letter)
      return false
    else
      if word.include? letter
        @guesses << letter
      else 
        @wrong_guesses << letter
      end
    end
  end

  def word_with_guesses
    mystryword = ''
    @word.split('').each do |letter|
      if(@guesses.include? letter)
        mystryword << letter
      else
        mystryword << '-'
      end
    end
    return mystryword
  end
  
  def check_win_or_lose
    if (self.word_with_guesses == @word)
      return :win
    elsif @wrong_guesses.length == 7
        return :lose
    else
       return :play
     end
  end
end