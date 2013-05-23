class Game


#	Make sure that all the instance variables in this class may only be READ and not WRITTEN to. 
  attr_reader :guesses_allowed, :current_guess_count, :current_guess, :guesses_left, :max_guess
# I added @max_guess so that I could keep track of the upper limit of the range easily.  
  @@messages = { win: "You won!",
                 lose:  "You lost! :-(",
                 too_low: "Your guess was too low!",
                 too_high: "Your guess was too high!" }


	# Initializes The number of guesses (or tries) a player is allowed before the game ends.
	# You should default number of guesses to 3 if the parameter is null.
	# Sets a guess counter to zero.
	# Creates a new instance of the Player class. 
	# Creates a new instance of the SecretNumber class and assigns it to the secret_number. Don't forget to pass along the
	# necessary parameters.
  # initializes the current guess to nil <<--! I didn't do this because it didn't seem necessary.
  def initialize(guesses_allowed=3, set_of_numbers=10)
    @guesses_allowed = guesses_allowed     #sets the number of guesses
    @current_guess_count = 0               #starts guess count at 0
    @player = Player.new                   #creates a new player
    @max_guess = set_of_numbers            #i did this to keep track of the upper limit of the range of guesses
    @secret_number = SecretNumber.new(set_of_numbers)
  end
  

  # Print who made this wonderful program :-)
  def print_created_by
    puts 'Created by James (#1) Bronzan'
  end
  
  def start_game
    puts "Welcome to the classy (pun intended) Secret Number Game!"
    print_created_by
    print "Please tell me your name: "
    @player.name = $stdin.gets.chomp
    puts "Welcome, #{@player.name}! You will have #{@guesses_allowed} guesses to guess a secret number between 1 and #{@max_guess}."
    puts "Let's get started!"
    guesses_left
    #^^ so, i think the right way to do this would be to make it a function with a return
    #instead of this procedural ridiculousness.  but in the process of trying to figure out
    #WHY I couldn't get my guesses_left to work properly, this is what I ended up with
    #and I don't really have the time to fix it.  Definitely I need a review of scoping and
    #best practices


    #below here is the guts of the game.  looping through.  i think it's
    #pretty self-explanatory.
    while @current_guess_count < @guesses_allowed
      puts "You have #{@guesses_left} guesses left."
      print "Please make guess number #{@current_guess_count + 1}: "
      @current_guess = $stdin.gets.chomp.to_i
      if guess_correct?(@current_guess) then
        puts @@messages[:win]
        exit
      elsif @current_guess > @secret_number.mynumber then
        puts @@messages[:too_high]
      elsif @current_guess < @secret_number.mynumber then
        puts @@messages[:too_low]
      end
        increment_guess_count
        guesses_left
    end
    puts @@messages[:lose]
    puts "The secret number was #{@secret_number.mynumber}"
  end



	# This method checks if the player guessed the correct secret number. 
  # It shoudl print out if they guessed correctly or guessed too high or too low.
	# Use the `@@messages` Hash to display this feedback.
	# Also let the player know how many guesses they have left.
	# If the guess is correct, make sure to return true, otherwise return false.
  def guess_correct?(guess)
    if guess == @secret_number.mynumber then return true end
      return false
  end
  #^^[JAMES #1 here] I see now from the comments above that most of the "guts" of the game 
  #were actually intended to be inside the guess_correct? method.  I think I could re-locate them
  #without too much difficulty, and will perhaps try, but I am so pleased to have a working
  #game that sort of uses classes (probably mostly wrongly), and I am sufficiently busy, that I
  #am going to leave it as is for now.

  # This method should increment every time the player guesses incorrectly.
  def increment_guess_count
      @current_guess_count += 1
  end
  

  # Calculates the guesses the player has left.
  def guesses_left
    @guesses_left = @guesses_allowed - @current_guess_count
  end

end
