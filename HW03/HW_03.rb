###############################################################################
#
# Introduction to Ruby on Rails
#
# Homework 03
#
# Purpose:
#
# Read the links below and complete the exercises in this file. This Lab
# is to help you better understand Arrays, Hashes and Loops that we
# learned in Lesson 03.
#
###############################################################################
#
# 1. Review your solution to Lab 02. Copy and Paste your solution to
#    this file.
#
# 2. Create a new Array variable called `set_of_numbers`, this will be
#    a range between 1 - 10 that our Player will guess from. Each value
#    in the Array should be an integer.
#
# 3. Change the variable `secret_number` (HW_02) so that instead of a hard-coded
#    Integer, it randomly chooses one of the options from `set_of_numbers`
#    ('secret_number' is the integer our Player will try to guess).
#
#      Hint: Look up Array#sample in the Ruby documentation.
#
# 4. Create a new Hash variable called `messages`. In this Hash will be
#    four Keys Value pairs:
#
#    1. :win - A String telling the Player that they have won.
#
#    2. :lose - A String telling the Player that they have lost and what
#       the correct number was.
#
#    3. :too_low - A String telling the Player that their guess was too
#       low.
#
#    4. :too_high - A String telling the Player that their guess was too
#       high.
#
# 5. Change the behavior of your program, so instead of hard coding, use the principles of DRY(don't repeat yourself). 
#    This means using a Loop to iterate over your code either until the Player has guessed the
#    correct number, or they have tried to guess 3 times.
#
# 6. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
#Put your solution below this line.
#
###############################################################################
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
								
3.downto(1) do |guess|
	puts "You have #{guess} guesses left."   #loop downwards from 3 to 1 (another time I would use "x" sted "guess")
	print "Your guess: "    #I like print instead of puts when asking for input
	player_guess = $stdin.gets.chomp.to_i

	message = case 				#pick correct message
		when player_guess === secret_number; messages[:win]
		when player_guess > secret_number; messages[:too_high]
		when player_guess < secret_number; messages[:too_low]
	end
	puts(message)				#print message
if player_guess == secret_number then exit 		#get out if player has won
elsif guess == 1
	puts(messages[:lose])						#must be a more elegant way of doing this
end
end
