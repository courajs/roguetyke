class Box
  attr_reader :width, :height
  def initialize(width:, height:)
    @width = width
    @height = height
  end
end

class MapFrame
  attr_reader :top, :left, :map, :frame
  attr_accessor :x, :y
  def initialize(top:, left:, map:, frame:)
    @top = top
    @left = left
    @map = map
    @frame = frame
    @x = 0
    @y = 0
  end

  def dimensions
    [y, x, top, left, frame.height+top, frame.width+left]
  end

  def scroll_right(n = 1)
    max_x = map.width - frame.width
    @x = [@x+n, max_x].min
  end

  def scroll_left(n = 1)
    @x = [@x-n, 0].max
  end

  def scroll_down(n = 1)
    max_y = map.height - frame.height
    @y = [@y + n, max_y].min
  end
  
  def scroll_up(n=1)
    @y = [@y-n, 0].max
  end
end
