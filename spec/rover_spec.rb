require 'rover'

describe 'rover' do
	let(:rover) { Rover.new(1, 3, :N) }

	context 'when intialized' do
		it 'has a position and a direction' do
			expect(rover.position).to eq ({ x: 1, y: 3, facing: :N })
		end
	end

	context 'when moving' do
		it 'can rotate 90 degrees left' do
			rover.rotate(:L)
			expect(rover.position[:facing]).to eq :W
		end

		it 'can rotate 90 degrees right' do
			rover.rotate(:R)
			expect(rover.position[:facing]).to eq :E
		end

		it 'can move forward in the direction it is facing' do
			rover.rotate(:R)
			rover.move
			expect(rover.position).to eq ({ x: 2, y: 3, facing: :E })
		end
	end
end