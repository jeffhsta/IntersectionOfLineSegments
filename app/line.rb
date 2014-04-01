class Line
	attr_reader :point_a, :point_b

	def initialize(point_a, point_b)
		@point_a = point_a
		@point_b = point_b
		validate_points
	end

	def ==(line)
		return false if line.class != Line
		line.point_a == @point_a && line.point_b == @point_b
	end

	def is_crossed_for(line)
		raise LineError.new, "Invalid Line" if line.class != Line
		det = (line.point_b.x - line.point_a.x) * (@point_b.y - @point_a.y) - (line.point_b.y - line.point_a.y) * (@point_b.x - @point_a.x)
		return false if det == 0

		s = ((line.point_b.x - line.point_a.x) * (line.point_a.y - @point_a.y) - (line.point_b.y - line.point_a.y) * (line.point_a.x - @point_a.x))/ det ;
  		t = ((@point_b.x - @point_a.x) * (line.point_a.y - @point_a.y) - (@point_b.y - @point_a.y) * (line.point_a.x - @point_a.x))/ det ;

  		line1_point = Point.new (@point_a.x + (@point_b.x - @point_a.x) * s), (@point_a.y + (@point_b.y - @point_a.y) * s)
  		line2_point = Point.new (line.point_a.x + (line.point_b.x - line.point_a.x) * t), (line.point_a.y + (line.point_b.y - line.point_a.y) * t)
  		
  		(line1_point == @point_a || line1_point == @point_b) && (line2_point == line.point_a || line2_point == line.point_b)
	end

	private

	def validate_points
		if @point_a.class != Point || @point_b.class != Point
			raise LineError.new, "Points are invalid"
		end
	end
end
