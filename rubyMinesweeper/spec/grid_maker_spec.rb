require_relative "../lib/grid_maker"

describe GridMaker do

  subject { GridMaker.new 'spec/fixtures/spec_grid_small.txt' }

  describe "player_grid" do
    it "should read frid from file as data structure" do
      a = Array.new(4) { Array.new(4, false) }
      a[0][0] = true
      a[2][1] = true
      subject.player_grids.first.should == a
    end

    it "should read multiple grids from file as data structure" do
      subject { GridMaker.new 'spec/fixtures/two_grids.txt' }
      a = Array.new(2) { Array.new(2, false) }
      a[0][0] = true
      subject.player_grids.first.should == a

      a = Array.new(2) { Array.new(2, false) }
      a[1][0] = true
      subject.player_grids.last.should == b
    end
  end
end
