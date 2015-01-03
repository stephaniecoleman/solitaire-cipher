class SolitaireCipher

	def initialize(message)
		@message = message
	end

	#1. Discard non A to Z, uppercase, split in 5 groups,use Xs to pad the last group, if needed
	def sanitize
		@message.gsub!(/\W/, "")
		@message.upcase!

		remainder = @message.length % 5
		if remainder > 0
			(5 - remainder).times do				
				@message << "X"
			end
		end

		@grouped = @message.scan(/...../)
	end

	#2. Use Solitaire to generate a keystream letter for each letter in the message. 
	def generate_keystream_letters
	
	end

	#3. Convert the message from step 1 into numbers, A = 1, B = 2, etc.
	def step_3
	
	end

	#4. Convert the keystream letters from step 2 using the same method
	def step_4
		
	end

	#5. Add the message numbers from step 3 to the keystream numbers from step 4 and subtract 26 from the result if it is greater than 26. For example, 6 + 10 = 16 as expected, but 26 + 1 = 1 (27 - 26).
	def step_5
		
	end

	#6. Convert the numbers from step 5 back to letters.
	def step_6
	end

end