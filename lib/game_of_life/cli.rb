module GameOfLife
  class Cli
    def self.start
      GameOfLife::Earth.new(5,5)
    end
  end
end