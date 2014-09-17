class MissionControl
	def initialize
		@grid_size = []
		@rover_starts = []
		@rover_moves = []
		@rovers = []
	end

	attr_reader :grid_size, :rover_starts, :rover_moves, :surface, :rovers

	def process_input_file(filename)
		File.exist?(filename) ? _read_data_from(filename) : (puts "File does not exist")
	end

	def create_surface
		@surface = Surface.new(@grid_size[0], @grid_size[1])
	end

	def place_rovers
		@rover_starts.each do |position|
			@rovers << Rover.new(position[0], position[1], position[2])
		end
	end

	private

	def _read_data_from(filename)
		_parse_all( File.open(filename) { |f| f.readlines } )
	end

	def _parse_all(data)
		_parse_grid_size(data.shift)
		_parse_rovers(data)
	end

	def _parse_grid_size(data)
		@grid_size = data.chomp.split(" ").map(&:to_i)
	end

	def _parse_rovers(data)
		data.each_with_index do |line, index|
			index.even? ? _parse_rover_starts(line) : _parse_rover_moves(line)
		end
	end

	def _parse_rover_starts(data)
		data = data.chomp.split(" ")
		@rover_starts << [data[0].to_i, data[1].to_i, data[2].to_sym]
	end

	def _parse_rover_moves(data)
		@rover_moves << data.chomp.chars.map(&:to_sym)
	end
end