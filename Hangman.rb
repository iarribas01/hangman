=begin
  # Just a personal project to practice my Ruby
  # This is a hangman game that generates ONE word
  # and allows you to input guesses until the word
  # is guessed correctly... you get the gist
  # you only get 5 chances
  
  # current problems --- no input validation, replay
  
  # author: Isabel Arribas
  # last edited : 12/09/2021 (US)
=end


# ********** WORD OBJECT ********** #
class Word
  
  # generates a random word and resets ingame word
  def initialize()
    @word = Word.generate_word()
    @ingame_word = Array.new
    (@word.length).times {@ingame_word << " "} # add number of spaces that the length of word is
  end
  
  
  public
  
  # string --- override to_s method to show actual word and not memory location
  def to_s()
    str = ""
    @ingame_word.each do |letter|
      if(letter == " ")
        str << "_"
      else
        str << letter
      end
      str << " "
    end
    return str
  end
  
  
  # void --- iterate through the word to fill in the blanks based on letter given
  def fill_blanks(guess)
    i = 0
    guess.upcase!
    
    for i in 0..@word.length
      if(@word[i] == guess)
        @ingame_word[i] = guess
      end
    end
    
  end
  
  # boolean --- determines if the letter guessed exists or not
  def is_a_letter?(guess)
    return true if @word.include?(guess)
    return false
  end
  
  
  # boolean --- checks if the user has guessed all the letters
  def is_guessed?()
    return false if @ingame_word.include?(' ')
    return true
  end

 
  
  private
  
  # string --- returns a random word in uppercase from an array of strings
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

# void --- displays all necessary game info
def display_game(word, guesses, chances)
  puts "\n***********************************"
  puts "Your word: #{word}"
  puts "\nChances left: #{chances}"
  puts "Your guesses: #{guesses_s(guesses)}"
  puts "Enter a letter: "
end

# boolean --- checks if the user has any more chances
def has_chances?(chances)
  return false if(chances==0)
  return true
end

# void --- displays guesses in single line separated by space
def guesses_s(guesses)
  str = ""
  guesses.each() {|letter| str << "#{letter} "}
  return str
end





# ********** MAIN PROGRAM ********** #

guesses = Array.new
guesses = Array.new
chances = 5 # every game starts with 5 chances
word = Word.new()

loop do
  display_game(word, guesses, chances)
  input = gets.chomp().upcase()
  guesses << input
  if (word.is_a_letter?(input))
    puts "That was a letter!"
    word.fill_blanks(input)
      if(word.is_guessed?())
        puts "***********************************"
        puts "You win!"
        break
      end
  else
    puts "That was not a letter :'("
    if(has_chances?(chances))
      chances-=1
    else
      puts "***********************************"
      puts "You lose..."
      break
    end
  end
end









