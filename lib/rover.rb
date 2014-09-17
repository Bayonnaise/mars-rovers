class Rover

	COMPASS = { :R => [:N, :E, :S, :W, :N],
							:L => [:N, :W, :S, :E, :N] }
	MOVEMENT = 	{ :N => [:y, 1],
	 							:E => [:x, 1],
	 							:S => [:y, -1],
	 							:W => [:x, -1]
	 						}

	def initialize(x, y, facing)
		@position = { x: x, y: y, facing: facing}
	end

	attr_reader :position

	def rotate(direction)
		COMPASS[direction].each_cons(2) do |item, next_item|
			position[:facing] = next_item and break if item == position[:facing]
		end
	end

	def move
		axis, change = MOVEMENT[position[:facing]].flatten
		position[axis] += change
	end
end