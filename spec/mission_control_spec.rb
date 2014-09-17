require 'mission_control'

describe 'mission control' do
	let(:nasa) { MissionControl.new }

	context 'when initialized' do
		it 'can have a starting_grid' do
			expect(nasa.grid_size).to eq []
		end
		
		it 'can have an array of rover starting positions' do
			expect(nasa.rover_starts).to eq []
		end

		it 'can have an array of move instruction lists' do
			expect(nasa.rover_moves).to eq []
		end
	end

	context 'when reading the input file' do
		it "prints a message if the file doesn't exist" do
			expect(nasa).to receive(:puts).with("File does not exist")
			nasa.process_input_file 'fake_file'
		end

		it 'can process the input grid size' do
			nasa.process_input_file 'test_input'
			expect(nasa.grid_size).to eq [5,5]
		end

		it 'can process the input starting positions' do
			nasa.process_input_file 'test_input'
			expect(nasa.rover_starts[0]).to eq [1,2,:N]
			expect(nasa.rover_starts[1]).to eq [3,3,:E]
		end

		it 'can process the movement list' do
			nasa.process_input_file 'test_input'
			expect(nasa.rover_moves[0]).to eq [:L,:M,:L,:M,:L,:M,:L,:M,:M]
			expect(nasa.rover_moves[1]).to eq [:M,:M,:R,:M,:M,:R,:M,:R,:R,:M]
		end
	end

	context 'when processing instructions' do
		before(:each) do
			nasa.process_input_file 'test_input'
			nasa.create_surface
			nasa.place_rovers
		end

		it 'can create the surface from the given grid size' do
			expect(nasa.surface.grid.flatten.size).to eq 25
		end

		it 'can place all rovers on the grid' do
			expect(nasa.rovers[0].position).to eq ({ x: 1, y: 2, facing: :N })
			expect(nasa.rovers[1].position).to eq ({ x: 3, y: 3, facing: :E })
		end

		
	end
end