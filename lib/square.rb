class Square
	def initialize
		@explored = false
	end

	attr_accessor :explored

	def explored?
		@explored
	end

	def explore!
		@explored = true
	end
end