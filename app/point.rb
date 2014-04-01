class Point
	attr_reader :x, :y

	def initialize(x, y)
		@x = x
		@y = y
		validate_values
	end

	def ==(point)
		return false if point.class != Point
		point.x == @x && point.y == @y
	end

	private

	def validate_values
		if (@x.class != Fixnum && @x.class != Float) || (@y.class != Fixnum && @y.class != Float)
			raise InvalidValuesForPointError.new, "Invalid values X, Y"
		else
			@x = @x.to_i if @x.class == Float
			@y = @y.to_i if @y.class == Float
		end
	end
end