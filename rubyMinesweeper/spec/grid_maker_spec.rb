require_relative "../lib/grid_maker"

describe GridMaker do

  describe "player_grid" do
    it "should read grid from file as data structure" do
      subject = GridMaker.new('spec/fixtures/spec_grid_small.txt')
      a = Array.new(4) { Array.new(4, false) }
      a[0][0] = true
      a[2][1] = true
      subject.player_grids.first.should == a
    end

    it "should read multiple grids from file as data structure" do
      file = 'spec/fixtures/two_grids.txt'
      subject = GridMaker.new(file)
      a = Array.new(2) { Array.new(2, false) }
      a[0][0] = true
      subject.player_grids.first.should == a

      b = Array.new(2) { Array.new(2, false) }
      b[1][0] = true

      puts "grids: #{subject.player_grids}"
      subject.player_grids.last.should == b
    end
  end
end
