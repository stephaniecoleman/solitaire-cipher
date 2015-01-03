require 'spec_helper'

describe Deck

	describe '#move_a' do
		it 'moves the A joker to the last index position' do
			deck = Deck.new
			deck.move_a
			expect(deck.deck[53]).to eq("A")
		end
	end

	describe '#move_b' do
		it 'moves the B joker to index 1' do
			deck = Deck.new
			deck.move_a
			deck.move_b
			expect(deck.deck[1]).to eq("B")
		end
	end
	
