class Position
  attr_reader :horizontal_index, :vertical_index
  def initialize horizontal_index, vertical_index
    @horizontal_index = horizontal_index
    @vertical_index = vertical_index
  end

  def to_s
    "Position: [#{@horizontal_index}, #{@vertical_index}]"
  end

  def == other
    other.horizontal_index == @horizontal_index &&
        other.vertical_index == @vertical_index
  end
end