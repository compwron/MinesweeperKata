class PlayerGrid
  require_relative "position"


  RELATIVE_POSITIONS = [
      Position.new(-1, -1), Position.new(0, -1), Position.new(+1, -1),
      Position.new(-1, 0),                       Position.new(+1, 0),
      Position.new(-1, +1), Position.new(0, +1), Position.new(+1, +1)
  ]

  def initialize grid
    @grid_horizontal_size = grid.size
    @grid_vertical_size = grid[0].size
    #@grid = translate_grid(grid)
  end

  def to_s
    @grid.map { |line|
      line.join(' ')
    }.join("\n")
  end

  # private
  def translate_grid grid
    grid.each_with_index.map { |horizontal_row, horizontal_index|
      horizontal_row.each_with_index.map { |item, vertical_index|
        is_star?(item) ? '*' : calculate_nearness_to_star(Position.new(horizontal_index, vertical_index), grid)
      }
    }
  end

  def is_star? item
    puts "item is: #{item}"
    item
  end

  def calculate_nearness_to_star position, grid
    puts "position is: #{position} "
    puts "with horiz #{position.horizontal_index}"
    puts" and vertical #{position.vertical_index}"
    puts "grid is #{grid}"

    p "valid relative points: #{valid_relative_points(position.horizontal_index, position.vertical_index)}"
    valid_relative_points(position.horizontal_index, position.vertical_index).map { |position|
      puts "valid relative point: #{position}"
      p "horiz index: #{grid[position.horizontal_index]}"
      is_star?(grid[position.horizontal_index][position.vertical_index]) ? 1 : 0
    }.inject(&:+)
  end

  def is_invalid? position
    in_horizontal_grid_range(position.horizontal_index) && in_vertical_grid_range(position.vertical_index)
  end

  def valid_relative_points horizontal_index, vertical_index
    RELATIVE_POSITIONS.map { |position|
      Position.new(position.horizontal_index + horizontal_index, position.vertical_index + vertical_index)
    }.reject { |position|
      is_invalid? position
    }
  end

  def in_horizontal_grid_range num
    num < 0 || num <= @grid_horizontal_size
  end

  def in_vertical_grid_range num
    num < 0 || num <= @grid_vertical_size
  end

end