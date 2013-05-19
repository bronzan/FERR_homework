###############################################################################
#
# Introduction to Ruby on Rails
#
# Lab 04
#
# Purpose:
#
# Read the steps below and complete the exercises in this file. This Lab
# will help you to review the basics of Object-Oriented Programming that
# we learned in Lesson 04.
#
###############################################################################
#
# 1. Review your solution to Lab 03. Copy and Paste your solution to
#    this file.
#
# 2. Create a new method called `increment_guess_count` that takes
#    an integer parameter and increments it by 1.
#
# 3. Create a new method called `guesses_left` that calculates how many guesses 
#	 out of 3 the Player has left. The method should take one parameter that is the 
#	 number of guesses the player has guessed so far. Use this new method in your 
#	 code to tell the user how many guesses they have remaining. 
#
# 4. Make sure to remove your local variable `guesses_left` and use the
#    new method instead.
#
# 5. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
# Student's Solution
#
###############################################################################
#
def increment_guess_count(count)
	return count += 1
end

def guesses_left(so_far)
	return 3 - so_far
end

puts "Welcome to Quicker 'n' Less Dirty Guess My Number!"
puts "Created By James \"\#1\" Bronzan."   		#I should have used single quotes so I wouldn't have to escape those chars.


# Get player's name
print "Be so kind as to tell me your (first) name: "
player_name = $stdin.gets.chomp

# Cheerfully greet player
puts		#there must be a better way to just add a blank line
puts "Hi, #{player_name}!  You will have three guesses to try to guess my number between 1 and 10."
puts "Here we go!"

set_of_numbers = []
1.upto(10) {|x| set_of_numbers.push(x)}  #create set of numbers array

secret_number = set_of_numbers.sample    #pick secret number
messages = {win:"You got it! Well done!",				#set up message hash
			lose:"Alas, you have failed in this simple task. My secret number was #{secret_number}.",
			too_high: "Too high! Try a lower number!",
			too_low: "Too low! Try a higher number!"}
guesses = 0								
until guesses == 3 do
	puts "You have #{guesses_left(guesses)} guesses left."   #loop until guesses = 3 (in which case you've lost, since otherwise you will already have exity)
	print "Your guess: "    								#I like print instead of puts when asking for input
	player_guess = $stdin.gets.chomp.to_i

	message = case 				#pick correct message
		when player_guess === secret_number; messages[:win]
		when player_guess > secret_number; messages[:too_high]
		when player_guess < secret_number; messages[:too_low]
	end
	puts(message)				#print message
if player_guess == secret_number then exit 	end	#get out if player has won
guesses = increment_guess_count(guesses)        #add one to the number of guesses
#puts guesses  -- this was here for debugging
end
							


puts(messages[:lose])
