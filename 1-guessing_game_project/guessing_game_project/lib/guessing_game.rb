class GuessingGame      
    def initialize(min, max)       # min and max are the range of numbers to guess (10,50)
      @secret_num = rand(min..max) # generate a random number between min and max  (30)
      @num_attempts = 0            # initialize number of attempts to 0
      @game_over = false           # initialize game over to false
      @min=min                     # initialize min to min
      @max=max                     # initialize max to max
      
    end
  
    def num_attempts       # getter method          
      @num_attempts
    end
  
    def game_over?        #getter method
      @game_over
    end
    
    def check_num(num)        # num is the number entered by the user
      @num_attempts += 1      # increment number of attempts by 1
      if num > @secret_num    # if the number entered by the user is greater than the secret number
        puts "too big"        # print "too big"
      elsif num < @secret_num # if the number entered by the user is less than the secret number
        puts "too small"      # print "too small"
      else                    # if the number entered by the user is equal to the secret number
        puts "you win"        # print "you win"
        @game_over = true     # set game over to true
      end
    end
  
    def ask_user             # ask the user to enter a number
      print "enter a number: "  # print "enter a number: "
      check_num(gets.chomp.to_i)  # check the number entered by the user
    end
  end
  
