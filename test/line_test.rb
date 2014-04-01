require "../app/line_error.rb"
require "../app/point.rb"
require "../app/line.rb"

describe Line do
	
	it "when pass any value that is not a Point (for example nil) in the constructor the Line should throw error" do
		expect{Line.new nil, nil}.to raise_error(LineError)
	end

	it "when pass any value that is not a Point (for example Fixnum) in the constructor the Line should throw error" do
		expect{Line.new 1, 2}.to raise_error(LineError)
	end

	it "when instiate two Lines with Points equals, example: A1 == A2 and B1 == B2, should return true for comparation the two Lines" do
		expect_line = Line.new Point.new(1, 2), Point.new(2, 1)
		expect_line.should == Line.new(Point.new(1, 2), Point.new(2, 1))
	end

	it "when instiate two Lines with inverted Points equals, exaple A1 == B2 and B1 == A2, but A1 != A2 and B1 != B2 should return false for comparation the two Lines" do
		expect_line = Line.new Point.new(1, 2), Point.new(2, 1)
		expect_line.should_not == Line.new(Point.new(2, 1), Point.new(1, 2))
	end

	it "when check if Line 1 is crossed for Line 2, being: L1 {(2, 2), (5, 5)} and L2 any type different that Line, should throw LineError" do
		line1 = Line.new Point.new(2, 2), Point.new(5, 5)
		expect{line1.is_crossed_for(nil)}.to raise_error(LineError)
	end

	it "when check if Line 1 is crossed for Line 2, being: L1 {(2, 2), (5, 5)} and L2 {(2, 6), (3, 2)}, should return true" do
		line1 = Line.new Point.new(2, 2), Point.new(5, 5)
		line2 = Line.new Point.new(2, 6), Point.new(3, 2)

		line1.is_crossed_for(line2).should == true
	end

	it "when check if Line 1 is crossed for Line 2, being: L1 {(3, 2), (5, 5)} and L2 {(2, 6), (2, 2)}, should return false" do
		line1 = Line.new Point.new(3, 2), Point.new(5, 5)
		line2 = Line.new Point.new(2, 6), Point.new(2, 2)

		line1.is_crossed_for(line2).should == false
	end
end