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
			expect(nasa.surface.grid.flatten.size).to eq 36
		end

		it 'can place all rovers on the grid' do
			expect(nasa.rovers[0].position).to eq ({ x: 1, y: 2, facing: :N })
			expect(nasa.rovers[1].position).to eq ({ x: 3, y: 3, facing: :E })
		end

		it 'can move a rover on instruction' do
			nasa.send_order(0, :R)
			nasa.send_order(0, :M)
			expect(nasa.rovers[0].position).to eq ({ x: 2, y: 2, facing: :E})
		end

		it 'can process all instructions for a single rover' do
			nasa.process_move_list_for(0)
			expect(nasa.rovers[0].position).to eq ({ x: 1, y: 3, facing: :N})
		end

		it 'can process all instructions for all rovers' do
			nasa.process_all_moves
			expect(nasa.rovers[0].position).to eq ({ x: 1, y: 3, facing: :N})
			expect(nasa.rovers[1].position).to eq ({ x: 5, y: 1, facing: :E})
		end
	end

	context 'during exploration' do
		before(:each) do
			nasa.process_input_file 'test_input'
			nasa.create_surface
			nasa.place_rovers
		end

		it 'marks rover starting squares as explored' do
			expect(nasa.surface.grid[1][2].explored?).to be true
		end

		it 'marks each square it reaches as explored' do
			nasa.send_order(0, :M)
			expect(nasa.surface.grid[1][3].explored?).to be true
		end
	end

	context 'when running from scratch' do
		it 'can do everything from one command' do
			nasa.run_mission_from('test_input')
			expect(nasa.rovers[0].position).to eq ({ x: 1, y: 3, facing: :N})
			expect(nasa.rovers[1].position).to eq ({ x: 5, y: 1, facing: :E})
		end

		it 'can output the rover finishing positions' do
			expect(nasa).to receive(:puts).with "1 3 N"
			expect(nasa).to receive(:puts).with "5 1 E"
			nasa.run_mission_from('test_input')
		end
	end
end