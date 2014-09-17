require_relative './square.rb'

class Surface
	def initialize(x, y)
		@grid = Array.new(x+1) { Array.new(y+1) { Square.new } }
	end

	attr_reader :grid

	def percent_explored
		(_explored_count * 1.0 / _square_count * 100).round
	end

	def print_grid
		puts
		grid.each do |row|
			row.each { |square| print _get_marker(square) }
			puts
		end
		puts
	end

	private

	def _square_count
		grid.flatten.size
	end

	def _explored_count
		grid.flatten.count(&:explored?)
	end

	def _get_marker(square)
		square.explored? ? "x " : ". "
	end
end
