require "../app/invalid_values_for_point_error.rb"
require "../app/point.rb"

describe Point do

	it "when pass nil for X and Y values the Point should throw InvalidValuesForPointError" do
		expect{Point.new nil, nil}.to raise_error(InvalidValuesForPointError)
	end

	it "when pass Float value for X or Y the Point should convert to Fixnum" do
		expect_point = Point.new 1, 2
		expect_point.should == (Point.new 1, 2.1)
	end

	it "when pass X or Y values whose type is different that Fixnum and Float should throw InvalidValuesForPointError" do
		expect{Point.new "", Time.now}.to raise_error(InvalidValuesForPointError)
	end
end