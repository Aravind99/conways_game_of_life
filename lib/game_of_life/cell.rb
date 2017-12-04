module GameOfLife
  # GameOfLife::Cell is a grid element where
  # GameOfLife::Earth is a grid
  # This @object will mutate based on following
  # Rules (see #next!)
  # Examples based on center element
  # 1. Any live cell with fewer than 2 neighbors dies,
  #    as if caused by under population.
  # Example:
  #   cell = 1
  #   cell.next! = 0 if cell.neighbors < 2
  #   1 = alive
  #   0 = dead
  #   | 0 | 0 | 0 |    | 0 | 0 | 0 |
  #   | 1 | 1 | 0 | => | 0 | 0 | 0 |
  #   | 0 | 0 | 0 |    | 0 | 0 | 0 |
  #
  # 2. Any live cell with more than 3 live neighbors dies,
  #    as if by overcrowding.
  # Example:
  #   cell = 1
  #   cell.next! = 0 if cell.neighbors > 3
  #   1 = alive
  #   0 = dead
  #   | 0 | 1 | 0 |    | 0 | 1 | 0 |
  #   | 1 | 1 | 0 | => | 1 | 0 | 0 |
  #   | 0 | 1 | 1 |    | 0 | 1 | 0 |
  #
  # 3. Any live cell with 2 or 3 live neighbors
  #    lives on to next! generation,
  # Example:
  #   cell = 1
  #   cell.next! = 1 if cell.neighbors == 3 or cell.neighbors == 2
  #   1 = alive
  #   0 = dead
  #   | 0 | 1 | 0 |    | 0 | 1 | 0 |
  #   | 1 | 1 | 0 | => | 1 | 1 | 0 |
  #   | 0 | 1 | 0 |    | 0 | 1 | 0 |
  #
  # 4. Any dead cell with more than 3 live neighbors
  #    lives on to next! generation,
  # Example:
  #   cell = 0
  #   cell.next! = 1 if cell.neighbors > 3
  #   1 = alive
  #   0 = dead
  #   | 0 | 1 | 0 |    | 0 | 0 | 0 |
  #   | 1 | 0 | 0 | => | 0 | 1 | 0 |
  #   | 0 | 1 | 1 |    | 0 | 0 | 0 |
  class Cell
    attr_accessor :alive, :neighbours

    # @param [Numeric or Boolean] alive_state
    def initialize(alive_state)
      unless alive_state.is_a?(Numeric) ||
          alive_state.is_a?(NilClass) ||
          alive_state.is_a?(TrueClass) ||
          alive_state.is_a?(FalseClass)
        raise 'Invalid state'
      end

      @alive = if alive_state.is_a?(Numeric)
                 alive_state > rand
               else
                 alive_state
               end
    end

    # change @alive state based on rules
    def next!
      if alive?
        die! if (neighbours < 2) || (neighbours > 3)
        relive! if (neighbours == 2) || (neighbours == 3)
      else
        relive! if neighbours > 3
      end
    end

    # true stands for cell is alive
    # false stands for cell is died
    # @return true or false
    def alive?
      alive
    end

    # @return 1 or 0
    def bool_to_num
      alive ? 1 : 0
    end

    # change @alive => false
    def die!
      @alive = false
    end

    # change @alive => true
    def relive!
      @alive = true
    end

  end
end
