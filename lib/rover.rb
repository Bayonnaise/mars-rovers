class Rover

	COMPASS_RIGHT = [:N, :E, :S, :W, :N]
	COMPASS_LEFT = [:N, :W, :S, :E, :N]
	MOVEMENT = 	{ :N => [:y, 1],
	 							:E => [:x, 1],
	 							:S => [:y, -1],
	 							:W => [:x, -1]
	 						}

	def initialize(x, y, facing)
		@position = { x: x, y: y, facing: facing}
	end

	attr_reader :position

	def rotate_left
		_rotate(COMPASS_LEFT)
	end

	def rotate_right
		_rotate(COMPASS_RIGHT)
	end

	def move
		axis, change = MOVEMENT[position[:facing]].flatten
		position[axis] += change
	end

	private

	def _rotate(compass)
		current = compass.find_index(position[:facing])
		position[:facing] = compass[current+1]
	end
end