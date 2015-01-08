require 'spec_helper'

describe 'Deck' do
	let(:deck) {Deck.new}

	describe '#move_a' do
		it 'moves the A joker to the last index position' do
			deck.move_a
			expect(deck.deck[53]).to eq("A")
		end
	end

	describe '#move_b' do
		it 'moves the B joker to index 1' do
			deck.move_a
			deck.move_b
			expect(deck.deck[1]).to eq("B")
		end
	end

	describe '#triple_cut' do
		it 'moves all cards above the top joker below the bottom joker and vice versa' do
			deck.move_a
			deck.move_b
			deck.triple_cut
			expect(deck.deck[53]).to eq(1)
		end
	end
	
	describe '#count_cut' do
		it 'cut the bottom card value in cards off the top of the deck and reinserts them just above the bottom card' do
			deck.move_a
			deck.move_b
			deck.triple_cut
			deck.count_cut
			expect(deck.deck[52]).to eq("B")
		end
	end

	describe '#find_output_letter' do
		it 'outputs the next letter in the keystream' do
			deck.move_a
			deck.move_b
			deck.triple_cut
			deck.count_cut
			expect(deck.find_output_letter).to eq("d")
		end
	end

	describe '#cycle_steps' do
		it 'cycles through steps and gets the next letter' do
			deck.cycle_steps
			binding.pry
			expect(deck.cycle_steps).to eq("w")
		end
	end

end
