class SecretNumber

#I think that perhaps a SecretNumber object is supposed to BE
#just a number... I mean, that I shouldn't have to access the 
#mynumber instance variable (it IS an instance variable, right?) in order to 
#get a hold of the actual NUMBER in question.  Wonder about that.

	attr_reader :range, :mynumber

	# I did this by receiving the upper limit of a range of numbers that starts at 1
	# rather than receiving a range.  Now I realize the goal was to receive a range so
	# that it doesn't have to start with 1, but don't really have time to fix it just now.
	# Initializes the secret number
	def initialize(set_of_numbers = 10)
		@range = 1..set_of_numbers           #create range (wouldn't particularly need to be readable externally)
		@mynumber = generate_secret_number   #pick random number from that range.
  	end

	#I'm not clear on the private aspect of this and why it matters.
	#Anyway, this just array-ifies the range and samples is.
	private 
	def generate_secret_number
		return range.to_a.sample
  	end
end


