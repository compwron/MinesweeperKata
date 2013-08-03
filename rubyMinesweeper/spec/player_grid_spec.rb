require_relative "../lib/player_grid"
require_relative "../lib/position"

describe PlayerGrid do

  describe "#to_s" do
  #   it "should translate to nearest structure" do
  #   	a = Array.new(2) {Array.new(2, false)}
  #   	a[0][0] = true
  #   	grid = PlayerGrid.new a

  #   	grid.to_s.should == "* 1\n1 1"
		# end

		# it "should translate to nearest structure" do
		# 	grid = PlayerGrid.new [Array.new(3, Array.new(3, false))]
  #   	grid.to_s.should == "* 1\n1 1\n 0 0"
		# end
	end

	describe "#calculate_nearness_to_star" do
		it "should not see star when there is no star" do
			a = Array.new(2) {Array.new(2, false)}
    	grid = PlayerGrid.new a
    	grid.calculate_nearness_to_star(Position.new(0, 0), a).should == 0
    	#grid.calculate_nearness_to_star(Position.new(1, 1), a).should == 0
    end

    it "should not see star when there is no star for largest index on either axis" do
      a = Array.new(2) {Array.new(2, false)}
      # a[0][0] = true
      grid = PlayerGrid.new a
      #grid.calculate_nearness_to_star(Position.new(0, 0), a).should == 0
      grid.calculate_nearness_to_star(Position.new(1, 1), a).should == 0
    end
  end

  describe "#valid_relative_points" do
    it "should only produce valid relative points" do
      a = Array.new(2) {Array.new(2, false)}
      # a[0][0] = true
      grid = PlayerGrid.new a
      valid_relative_points = grid.valid_relative_points(Position.new(0, 0))
      puts "!!!!!!!!! valid relative points #{valid_relative_points.join("\n")}"
      valid_relative_points.should include Position.new(0, 1)
      valid_relative_points.should include Position.new(1, 1)
      valid_relative_points.should include Position.new(1, 0)
      valid_relative_points.should_not include Position.new(-1, -1)

    end
  end

  describe "#calculate_relative_position" do
    it "should calculate relative position of -1, -1 and 0, 0 to be -1, -1" do
      a = Array.new(2) {Array.new(2, false)}
      grid = PlayerGrid.new a
      grid.calculate_relative_position(Position.new(0, 0), Position.new(-1, -1))
    end

    it "should calculate relative position of 1, 1 and 0, 0 to be 1, 1" do
      a = Array.new(2) {Array.new(2, false)}
      grid = PlayerGrid.new a
      grid.calculate_relative_position(Position.new(0, 0), Position.new(1, 1))
    end
  end

  describe "#is_valid?" do
    it "should know that a point is valid on the grid" do
      a = Array.new(2) {Array.new(2, false)}
      grid = PlayerGrid.new a
      grid.is_valid?(Position.new(0, 0)).should be_true
    end

    it "should know that a point is not valid on the grid" do
      a = Array.new(2) {Array.new(2, false)}
      grid = PlayerGrid.new a
      grid.is_valid?(Position.new(-1, -1)).should be_false
    end
  end
end
