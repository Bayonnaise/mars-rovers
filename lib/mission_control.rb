require_relative './surface.rb'
require_relative './rover.rb'
require_relative './surface.rb'


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

	def process_all_moves
		_rover_count.times { |rover| process_move_list_for(rover) }
	end

	def process_move_list_for(rover)
		@rover_moves[rover].each { |command| send_order(rover, command) }
	end

	def send_order(rover, command)
		command == :M ? @rovers[rover].move : @rovers[rover].rotate(command)
	end

	def run_mission_from(filename)
		process_input_file(filename)
		_initialize_elements
		process_all_moves
		_output_final_positions
	end

	private

	def _initialize_elements
		create_surface
		place_rovers
	end

	def _rover_count
		@rovers.count
	end

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

	def _output_final_positions
		@rovers.each do |rover|
			puts "#{rover.position[:x]} #{rover.position[:y]} #{rover.position[:facing]}"
		end
	end
end