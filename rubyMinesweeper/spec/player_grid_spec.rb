require_relative "../lib/player_grid"

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
    	# a[0][0] = true
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

  describe "#relative_points" do
    it "should only produce valid relative points" do

    end
  end
end
