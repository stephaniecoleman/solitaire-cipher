require_relative './deck.rb'
require 'pry'

class SolitaireCipher
	attr_accessor :message, :keystream, :final_encryption

	def initialize(message)
		@message = message
		@keystream = []
		@summed = []
		@final_encryption = []
		@alphabet = ("a".."z").to_a
	end

	#1. Discard non A to Z, uppercase, split in 5 groups,use Xs to pad the last group, if needed
	def sanitize
		@message.gsub!(/[^a-zA-Z]/, "")
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
		deck = Deck.new
		while @keystream.length < @message.length
			letter = deck.cycle_steps
			unless letter.nil?
				@keystream << letter
			end
		end
		@keystream
	end

	#3. Convert the message from step 1 into numbers, A = 1, B = 2, etc.
	def step_3
		message_array = @message.downcase.split("")
		@message_num_array = []
		message_array.each do |letter|
			@message_num_array << (@alphabet.index(letter) + 1)
		end
		@message_num_array
	end

	#4. Convert the keystream letters from step 2 using the same method
	def step_4
		@keystream_num_array = []
		@keystream.each do |letter|
			@keystream_num_array << (@alphabet.index(letter) + 1)
		end
		@keystream_num_array
	end

	#5. Add the message numbers from step 3 to the keystream numbers from step 4 and subtract 26 from the result if it is greater than 26. For example, 6 + 10 = 16 as expected, but 26 + 1 = 1 (27 - 26).
	def step_5
		@keystream_num_array.each_with_index do |num, index|
			sum = num + @message_num_array[index]
			if sum > 26
				sum -= 26
			end
			@summed << sum
		end
		@summed
	end

	#6. Convert the numbers from step 5 back to letters.
	def step_6
		@summed.each do |num|
			@final_encryption << @alphabet[num - 1]
		end
		@final_encryption
	end

end

solitaire = SolitaireCipher.new("Code in Ruby, live longer!")
solitaire.sanitize
solitaire.generate_keystream_letters
solitaire.step_3
solitaire.step_4
solitaire.step_5
solitaire.step_6
binding.pry

