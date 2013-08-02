require_relative "../lib/player_grid"

describe PlayerGrid do

  describe "#to_s" do
    it "should translate to nearest strucutre" do
    	a = Array.new(2) {Array.new(2, false)}
    	a[0][0] = true
    	grid = PlayerGrid.new a

    	grid.to_s.should == "* 1\n1 1"
		end

		# it "should translate to nearest structure" do
		# 	grid = PlayerGrid.new [Array.new(3, Array.new(3, false))]
  #   	grid.to_s.should == "* 1\n1 1\n 0 0"
		# end
	end
end
