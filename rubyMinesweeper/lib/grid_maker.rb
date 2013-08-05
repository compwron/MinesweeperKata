class GridMaker
  attr_reader :player_grids

  def initialize fileName
    @player_grids = make_grids(lines_from_file(fileName))
  end

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

  def make_grids(lines)
    grids = []
    map = []
    is_first_time = true
    lines.each { |line|
      if is_numbers?(line) then
        if is_first_time then
          is_first_time = false
        else
          grids << map.clone
          map = []
        end
      else

        map << translate_line(line)
      end
    }
    grids << map
    grids.compact
  end

  def is_numbers? line
    /\d/ =~ line ? true : false
  end
end