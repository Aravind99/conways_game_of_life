module GameOfLife
  # Cli will log the output
  class Cli
    def self.start(width, height, seed_probability)
      if width.is_a?(Numeric) && height.is_a?(Numeric)
        puts seed_probability.class
        game = GameOfLife::Earth.new(width, height, seed_probability)
        game.log
        # while game.cells.flatten.map(&:bool_to_num).include? 1
        #   game.next!
        #   game.log
        # end
      else
        puts 'please provide valid integers next time!'
      end
    end
  end
end
