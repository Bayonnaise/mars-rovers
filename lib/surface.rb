require_relative './square.rb'

class Surface
	def initialize(x, y)
		@grid = Array.new(x+1) { Array.new(y+1) { Square.new } }
	end

	attr_reader :grid

	def print_grid
		grid.each_with_index do |row, x_index|
			row.each_with_index do |square, y_index|
				print _get_marker(square, x_index, y_index)
			end
			puts
		end
	end

	private

	def _get_marker(square, x, y)
		return "x " if square.explored?
		". "
	end


end
