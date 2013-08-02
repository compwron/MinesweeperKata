require_relative "../lib/player_grid"

describe PlayerGrid do

  subject { PlayerGrid.new [['*', '.'], ['.', '.']]} 

  describe "#to_s" do
    it "should translate to nearest strucutre" do
    	subject.to_s.should == "* 1\n1 1"
		end
	end
end
