module GameOfLife
  # Cli will log the output
  class Cli
    def self.start(width, height, seed_probability, speed)
      if width.is_a?(Numeric) && height.is_a?(Numeric)
        puts '1 = alive', '0 = dead'
        game = GameOfLife::Earth.new(width, height, seed_probability)
        puts game.log
        while game.cells.flatten.map(&:bool_to_num).include? 1
          sleep speed || 1
          game.next!
          puts game.log
        end
      else
        puts 'please provide valid integers next time!'
      end
    end
  end
end
