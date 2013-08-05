class GridMaker
  attr_reader :player_grids

  def initialize fileName
    @player_grids = make_grids(fileName)
  end

  def make_grids(fileName)
    lines = []
    File.open(fileName).map { |line|
      lines << line
    }

    grids = []
    map = []
    is_first_time = true
    lines.each { |line|
      if is_numbers?(line) then
        if is_first_time then
          is_first_time = false
        else
          grids << map.clone
        end
      else
        translated_line = line.gsub("\n", '').split('').map { |item|
          item == '*' ? true : item == '.' ? false : item
        }
        map << translated_line
      end
    }
    grids << map
    grids.compact
  end

  def is_numbers? line
    /\d/ =~ line ? true : false
  end
end