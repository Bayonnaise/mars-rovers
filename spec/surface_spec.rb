require 'surface'

describe 'surface' do
	let(:surface) { Surface.new(5,5) }

	context 'when initialized' do
		it 'has a grid of size x * y' do
			expect(surface.grid.size).to eq 6
			expect(surface.grid.flatten.size).to eq 36
		end

		it 'has a grid of squares' do
			expect(surface.grid.flatten.all? { |square| square.is_a? (Square) }).to be true
		end
	end

	context 'handling the results' do
		it 'can print the grid to terminal' do
			allow(surface).to receive(:puts)
			expect(surface).to receive(:print).exactly(surface.grid.flatten.size).times
			surface.print_grid
		end

		it 'can return the exploration percentage' do
			expect(surface.percent_explored).to eq 0
			surface.grid[3][3].explore!
			expect(surface.percent_explored).to eq 3
		end
	end
end