class GridMaker
	attr_reader :player_grids
	def initialize fileName
    @player_grids = make_grids(fileName)
	end

  def make_grids(fileName)
    a = File.open(fileName).map{ |line|
      if (line.include?('*') || line.include?('.')) then
        line.split('').map { |item|
          item == '*' ? true : item == '.' ? false : nil
        }.compact
      end
    }.compact
    [a]
  end
end