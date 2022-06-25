class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"] # constant class variable 

  def self.random_word #class method    #cat
    DICTIONARY.sample  #returns a random word from the dictionary
  end
  def initialize                                        #instance method
    @secret_word = Hangman.random_word    #cat          # @secret_word to a random word from the dictionary
    @guess_word = Array.new(@secret_word.length, "_")#[_,_,_] # @guess_word to an array with the same length as the @secret_word containing '_' as each element
    @attempted_chars = []                               # @attempted_chars to an empty array
    @remaining_incorrect_guesses = 5                    # @remaining_incorrect_guesses to 5
  end

  def guess_word                   #instance method   [_, _, _, _]
    @guess_word
  end
  def attempted_chars              #getter method #instance method []
    @attempted_chars
  end
  def remaining_incorrect_guesses  #getter method #instance method 5
    @remaining_incorrect_guesses
  end
  # -----------------------------------------
  def already_attempted? (char) #instance method 
    return true if @attempted_chars.include?(char) #return true if @attempted_chars includes char
    false
  end
  # -----------------------------------------
  def get_matching_indices (char) #instance method char = "c" #returns [0]
    indices = []
    @secret_word.each_char.with_index do |c, i|
      indices << i if c == char
    end
    indices
  end
  # -----------------------------------------
  def fill_indices (char, indices) #instance method (char = "c", indices = [0]) #returns [c, _, _, _]
    indices.each do |i|
      @guess_word[i] = char
    end
  end
#  -----------------------------------------
def try_guess(char)
  if self.already_attempted?(char)
    puts "that char has already been guessed"
    return false
  end

  @attempted_chars << char

  matching_indices = self.get_matching_indices(char)
  if matching_indices.empty?
    @remaining_incorrect_guesses -= 1
  else
    self.fill_indices(char, matching_indices)
  end

  true
end
# --------------------------------------------
def ask_user_for_guess
  print "Enter a char:"
  char = gets.chomp
  self.try_guess(char)
end
# -----------------------------------------------
def win?
  if @guess_word.join("") == @secret_word
    puts 'WIN'
    return true
  end
  false
end
  # ------------------------------------------------
  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    else
      return false
    end
  end
  # -------------------------------------------------
  def game_over?                         
    if self.win? || self.lose?
      puts "The word was #{@secret_word}"
      return true
    else
      return false
    end
  end
  # --------------------------------------------------
end
