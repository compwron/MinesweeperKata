require_relative "position"
class PlayerGrid

  RELATIVE_POSITIONS = [
      Position.new(-1, -1), Position.new(0, -1), Position.new(+1, -1),
      Position.new(-1, 0),                       Position.new(+1, 0),
      Position.new(-1, +1), Position.new(0, +1), Position.new(+1, +1)
  ]

  def initialize grid
    @grid_horizontal_size = grid.size
    @grid_vertical_size = grid[0] ? grid[0].size : 0
    @grid = translate_grid(grid)
  end

  def to_s
    @grid.map { |line|
      line.join(' ')
    }.join("\n")
  end

  def translate_grid grid
    grid.each_with_index.map { |horizontal_row, horizontal_index|
      horizontal_row.each_with_index.map { |item, vertical_index|
        position = Position.new(horizontal_index, vertical_index)
        item_at_position = grid[position.horizontal_index][position.vertical_index]
        is_star?(item_at_position) ? '*' : calculate_nearness_to_star(position, grid)
      }
    }
  end

  def is_star? item
    !!(item)
  end

  def calculate_nearness_to_star position, grid
    valid_relative_points(position).map { |position|
      contents_of_point = grid[position.horizontal_index][position.vertical_index]
      is_star?(contents_of_point) ? 1 : 0
    }.inject(&:+)
  end

  def valid_relative_points starting_position
    RELATIVE_POSITIONS.map { |position|
      calculate_relative_position(position, starting_position)
    }.reject { |position|
      ! is_valid? position
    }
  end

  def calculate_relative_position(position, starting_position)
    Position.new(position.horizontal_index + starting_position.horizontal_index, position.vertical_index + starting_position.vertical_index)
  end

  def is_valid? position
    in_horizontal_grid_range(position.horizontal_index) && in_vertical_grid_range(position.vertical_index)
  end

  def in_horizontal_grid_range num
    num >= 0 && num < @grid_horizontal_size
  end

  def in_vertical_grid_range num
    num >= 0 && num < @grid_vertical_size
  end

  def header index
    "Field ##{index}:\n#{self}\n"
  end

end