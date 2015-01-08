class Deck
	attr_accessor :deck

	def initialize
		@deck = (1..52).to_a << "A" << "B"
	end

	def move_a
		move_one(@deck.index("A"))
	end

	def move_b
		2.times { move_one(@deck.index("B")) }
	end

	def triple_cut
		a_index = @deck.index("A")
		b_index = @deck.index("B")
		@new_deck = []
		if a_index < b_index
			@new_deck << @deck[(b_index + 1)..-1] << @deck[a_index..b_index] << @deck[0...a_index]
		else
			@new_deck << @deck[(a_index + 1)..-1] << @deck[b_index..a_index] << @deck[0...b_index]
		end
		@deck = @new_deck.flatten
	end

	# Perform a count cut using the value of the bottom card. Cut the bottom card's value in cards off the top of the deck and reinsert them just above the bottom card.
	def count_cut
		insert_me = @deck[0..(@deck[-1] - 1)]
		@deck.shift(@deck[-1])
		@deck.insert(-2, insert_me)
		@deck = @deck.flatten
	end

	#Convert the top card to it's value and count down that many cards from the top of the deck, with the top card itself being card number one. Look at the card immediately after your count and convert it to a letter. This is the next letter in the keystream. If the output card is a joker, no letter is generated this sequence.
	def find_output_letter
		top_card_value = @deck[0]
	
		if top_card_value == "A" || top_card_value == "B"
			num_to_convert = @deck[53]
		else
			num_to_convert = @deck[top_card_value]
		end

		alphabet = ("a".."z").to_a

		if num_to_convert == "A" || num_to_convert == "B"
			letter = nil
		elsif num_to_convert > 26
			num_to_convert = num_to_convert - 26
			letter = alphabet[num_to_convert - 1]
		else
			letter = alphabet[num_to_convert - 1]
		end
		letter
	end

	def cycle_steps
		move_a
		move_b
		triple_cut
		count_cut
		find_output_letter
	end

	protected
	def move_one(index)
		if index == @deck.length - 1
			@deck.insert(1, @deck.delete_at(index))
		else
			@deck.insert(index + 1, @deck.delete_at(index))
		end
	end

end