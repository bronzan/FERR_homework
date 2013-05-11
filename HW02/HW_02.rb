###############################################################################
#
# Introduction to Ruby on Rails
#
# Lab 02
#
# Purpose:
#
# Read the links below and complete the exercises in this file. This Lab
# is to test your knowledge of Variables and Conditionals which we
# learned in Lesson 02.
#
###############################################################################
# This program by James Bronzan, student in FERR at GA, May 11, 2013
#
# 1. Welcome users to your game. Let them know you are the creator. 
#
# 2. Ask the user for their name and store it in a variable.
#
# 3. Personally greet the player by printing to the screen, "Hi player_name! 
#	 Let them know they have 3 guesses to guess the Secret Number between 1 and 10.
#
# 4. Create a new Integer variables called `guesses_left`, this will count
#    down how many more times the Player can guess. It's initial value should
#    be 3.
#
#
# 5. Using String Interpolation, concatenate the variable `guesses_left`
#    into a String that tells the Player how many guesses they have left
#    and print it to the screen.
#
# 6. Create a new Integer variable called `secret_number` and set the value to
#    a number of your choosing between 1 and 10. This is the number that
#    our Player will try to guess.
#
# 7. Ask the Player to make their first guess. (Remember to cast input from the Player into the appropriate
#    data type).
#
# 8.  Use a Conditional to find out if the Player has guessed the
#     correct number.
#
#     1. If they guessed correctly, tell them they won and exit the
#        script.
#	
#	  2. For an incorrect guess decrement the variable `guesses_left` by 1 and
#     print to the screen how many guesses the Player has left.
#
#     		1. If they guessed a number too low, tell them that they need to
#        	   guess higher on their next guess.
#
#     		2. If they guessed a number too high, tell them that they need to
#        	   guess lower on their next guess.
#
# 9. Repeat the above process for a total of 3 times asking the Player
#     to make a guess and verify if the Player won.
#
# 10. If they do not make the correct guess after 3 tries, print that
#     the Player loses and what the `secret_number` was.
#
# 11. Make sure to add helpful comments to your code to document what
#     each section does.
#
###############################################################################
#
# Student's Solution
#
###############################################################################
# This program by James Bronzan, student in FERR at GA, May 11, 2013
#
puts "Welcome to Quick 'n' Dirty Guess My Number!"
puts "Created By James \"\#1\" Bronzan."   		#I should have used single quotes so I wouldn't have to escape those chars.


# Get player's name
print "Be so kind as to tell me your (first) name: "
player_name = $stdin.gets.chomp

# Cheerfully greet player
puts		#there must be a better way to just add a blank line
puts "Hi, #{player_name}!  You will have three guesses to try to guess my number between 1 and 10."
puts "Here we go!"

#initialize number of guesses left and tell user
guesses_left = 3
puts "You have " + guesses_left.to_s + " guesses left."

secret_number = 1 + rand(10)  	#I went ahead and looked up random integers
								#Though I'm not clear on using vs. not using the Random object

print "Your first guess: "    #I like print instead of puts when asking for input
player_guess = $stdin.gets.chomp.to_i

if player_guess == secret_number   #another time I might use a case and the output of <==>
	puts "You got it!  Well done!"
	exit
elsif player_guess > secret_number
	puts "Too high!  Try a lower number."
	guesses_left -= 1
elsif player_guess < secret_number
		puts "Too low!  Try a higher number."
		guesses_left -=1
end


#second guess ... This should really be looped
puts "You have " + guesses_left.to_s + " guesses left."
print "Your second guess: "
player_guess = $stdin.gets.chomp.to_i
if player_guess == secret_number
	puts "You got it!  Well done!"
	exit
elsif player_guess > secret_number
	puts "Too high!  Try a lower number."
	guesses_left -= 1
elsif player_guess < secret_number
		puts "Too low!  Try a higher number."
		guesses_left -=1
end

#third and final guess
puts "Last guess!  Good luck!"
print "Your THIRD AND FINAL guess: "
player_guess = $stdin.gets.chomp.to_i
if player_guess == secret_number
	puts "You got it!  Well done!"
elsif player_guess != secret_number
	puts "Alas!  You have failed at this simple task."
	puts "The number I was thinking of was #{secret_number}."
end