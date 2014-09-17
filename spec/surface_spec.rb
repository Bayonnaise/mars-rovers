require 'surface'

describe 'surface' do
	context 'when initialized' do
		let(:surface) { Surface.new(5,5) }

		it 'has a grid of size x * y' do
			expect(surface.grid.size).to eq 5
			expect(surface.grid.flatten.size).to eq 25
		end

		it 'has a grid of squares' do
			expect(surface.grid.flatten.all? { |square| square.is_a? (Square) }).to be true
		end
	end
end