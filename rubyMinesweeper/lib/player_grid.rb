class PlayerGrid

	def initialize grid
		@grid = translate_grid(grid)
	end

	def to_s
		@grid.map{ |line|
			line.join(' ')
		}.join("\n")
	end

	private
	def translate_grid grid
		grid.each_with_index.map {|line, line_index|
			line.each_with_index.map {|item, item_index|
				is_star?(item) ? '*' : calculate_nearness_to_bomb([line_index, item_index], grid)
			}
		}
	end

	def is_star? item
		item
	end

	def calculate_nearness_to_bomb position, grid
		0
		# grid[position.first][position.last]
	end
end