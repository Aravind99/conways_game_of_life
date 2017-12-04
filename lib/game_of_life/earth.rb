module GameOfLife
  class Earth
    # GameOfLife::Cell is a grid element where
    # GameOfLife::Earth is a grid
    # This class doesn't hold any logic related to
    # cell mutation rules
    attr_accessor :cells
    attr_reader   :height, :width

    def initialize(width, height, seed_probability = nil)
      @generation = 1
      seed_probability = rand if seed_probability.nil?

      @width  = width
      @height = height

      @cells = Array.new(width) do
        Array.new(height) do
          Cell.new(seed_probability)
        end
      end
    end

    # @return row of @cells
    def [](x)
      @cells[x]
    end

    def next!
      @generation += 1
      @cells.each_with_index do |col, x|
        col.each_with_index do |cell, y|
          cell.neighbours = alive_neighbours(x, y)
        end
      end

      @cells.each { |row| row.each(&:next!) }
      nil
    end

    # @param [row] x
    # @param [col] y
    def alive_neighbours(x, y)
      [
          [-1, -1], [0, -1], [1, -1],  # over
          [-1,  0],          [1,  0],  # sides
          [-1,  1], [0,  1], [1,  1]   # under
      ].inject(0) do |sum, pos|
        _x = x + pos[0]
        _y = y + pos[1]

        # if we are in the Earth sizes
        if _x >= 0 && _y >= 0 && _x < @width && _y < @height
          sum += self[_x][_y].bool_to_num
        end

        sum
      end
    end

    def log
      grid = "Generation #{@generation}"
      @cells.transpose.each do |row|
        grid += "\n"
        grid += row.map(&:bool_to_num).join(' | ')
      end
      grid += "\n"
      grid
    end
  end
end