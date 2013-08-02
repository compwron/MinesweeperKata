require_relative "../lib/grid_maker"

describe GridMaker do

  subject { GridMaker.new "fixtures/spec_grid_small.txt"}

  describe "#player_grid_dimensions" do
    it "should make grid of size specified in fixture" do
    	subject.player_grid_dimensions.should == [4, 4]
    end
	end
end
