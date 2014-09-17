require 'square'

describe 'square' do
	context 'when initialized' do
		let(:square) { Square.new }
		
		it 'is unexplored' do
			expect(square).not_to be_explored
		end

		it 'can be explored' do
			square.explore!
			expect(square).to be_explored
		end
	end
end