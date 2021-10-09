=begin
  # Just a personal project to practice my Ruby
  # This is a hangman game that generates ONE word
  # and allows you to input guesses until the word
  # is guessed correctly... you get the gist
  # you only get 5 chances
  
  # author: Isabel Arribas
  # last edited : 10/09/2021 (US)
=end


# ********** WORD OBJECT ********** #
class Word
  
  # initialize word and set ingame_word to empty and same number of letters
  def initialize()
    @word = Word.generate_word()
    @ingame_word = Array.new
    (word.length).times {ingame_word << " "} # add number of spaces that the length of word is
  end
  
  
  public
  
  def ingame_word
    return @ingame_word
  end
  
  def word
    return @word
  end
  
  # override to_s method to show actual word and not memory location
  #return string
  def to_s()
    return @word
  end
  
  
  # displays word based on the correct letters guessed
  # no return
  def display_ingame_word()
    @ingame_word.each do |letter|
      if(letter == " ")
        print "_"
      else
        print letter
      end
      print " "
    end
  end
  
  
  #iterate through the word to fill in the blanks based on letter given
  #no return
  def fill_blanks(guess)
    i = 0
    guess.upcase!
    
    for i in 0..@word.length
      if(@word[i] == guess)
        @ingame_word[i] = guess
      end
    end
    
  end
  
  
  
  # determines if the letter guessed exists or not
  # return boolean
  def is_a_letter?(guess)
    @word.each_char do |n|
      return true if (guess == n)
    end
    return false
  end

 
  
  private
  
  # returns a random word in uppercase from an array of strings
  # private class method
  #return string
  def self.generate_word()
    arr = [
           "puppy",
           "popcorn",
           "pigeon",
           "weapon",
           "impossible"
          ]
    return rand_word = arr[rand(arr.length - 1)].upcase
  end
  
  
end

# ********** METHODS ********** #

def display_game(word, guesses)
  word.display_ingame_word()
  puts ""
  puts "Chances left:\t #{chances}"
  print "Guesses left:\t "
  guesses.each() {|n| print "#{n} "}
end

# checks if the user has any more chances
# return boolean
def has_chances?()
  return false if(chances==0)
  return true
end




# ********** MAIN PROGRAM ********** #

guesses = Array.new
chances = 5 # every game starts with 5 chances
word = Word.new()
puts word








