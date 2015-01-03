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

	def move_one(index)
		if index == @deck.length - 1
			@deck.insert(1, @deck.delete_at(index))
		else
			@deck.insert(index + 1, @deck.delete_at(index))
		end
	end


end