require_relative "../lib/grid_maker"

describe GridMaker do

  subject { GridMaker.new "spec/fixtures/spec_grid_small.txt"}

  describe "player_grid" do
    it "should read frid from file as data structure" do
      a = Array.new(4) {Array.new(4, false)}
      a[0][0] = true
      a[2][1] = true
      subject.player_grid.should == a
    end
  end


end
