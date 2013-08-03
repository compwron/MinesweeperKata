class GridMaker
	attr_reader :player_grid
	def initialize fileName
    @player_grid = make_grid(fileName)
	end

  def make_grid(fileName)
    File.open(fileName).map{ |line|
      if (line.include?('*') || line.include?('.')) then
        line.split('').map { |item|
          item == '*' ? true : item == '.' ? false : nil
        }.compact
      end
    }.compact
  end
end