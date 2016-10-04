class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.
  # Get a word from remote "random word" service
  

  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  def initialize(new_word)
    @word = new_word
    @guesses = ''
    @wrong_guesses = ''
    
   
  end
#generate random word
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
 #is the letter in the word?
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
#shows word to be guessed as letters hidden as a '-' until they are guessed
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
  #checks if win or loss returns a status
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