class Surface
	def initialize(x, y)
		@grid = Array.new(x) { Array.new(y) { Square.new } }
	end

	attr_reader :grid
end