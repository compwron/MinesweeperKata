require_relative "../lib/player_grid"
class GridMaker
  
  attr_reader :player_grids

  def initialize fileName
    @lines = lines_from_file(fileName)
    @player_grids = make_player_grids(make_grids)
  end

  def make_player_grids(grids)
    grids.map { |grid|
      grid.empty? ? nil : PlayerGrid.new(grid)
    }.compact
  end

  def make_grids
    grids = []
    map = []
    @lines.each_with_index { |line, index|
      if is_numbers?(line) then
        if !is_first_time(index) then
          map = add_map_to_grids_and_reset_map(grids, map)
        end
      else
        map << translate_line(line)
      end
    }
    grids << map
  end

  private
  def lines_from_file fileName
    lines = []
    File.open(fileName).map { |line|
      lines << line
    }
    lines
  end

  def translate_line line
    line.gsub("\n", '').split('').map { |item|
      item == '*' ? true : item == '.' ? false : item
    }
  end

  def add_map_to_grids_and_reset_map(grids, map)
    grids << map.clone
    []
  end

  def is_first_time(index)
    index == 0
  end

  def is_numbers? line
    !!(/\d/ =~ line) # translates into true/false
  end
end