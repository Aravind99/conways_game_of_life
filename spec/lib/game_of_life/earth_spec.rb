require_relative '../../spec_helper'

RSpec.describe GameOfLife::Earth do

  let(:earth) do
    GameOfLife::Earth.new(6, 5, 0.5)
  end

  context 'initialize' do
    it 'create new Earth will cells' do
      expect(earth.cells.count).to eq 6
      expect(earth.cells.first.count).to eq 5
    end
  end

  context '#[]' do
    it 'provides access to @cells' do
      expect(earth[1][1]).to eq earth.cells[1][1]
    end

    it 'allow get cell element' do
      expect(earth[0][1]).to eq earth.cells[0][1]
    end

    it 'allow set cell element' do
      earth[1][1].relive!
      expect(earth[1][1].alive?).to be_truthy
    end
  end

  describe '#alive_neighbours' do
    let(:earth) do
      GameOfLife::Earth.new(3, 3, false)
    end

    # top row [-1, -1], [0, -1], [1, -1]
    it 'detects neighbour on the top left [-1, -1]' do
      earth[0][0].relive!
      expect(earth.alive_neighbours(1,1)).to eq 1
    end

    it 'detects neighbour on the top [0, -1]' do
      earth[1][0].relive!
      expect(earth.alive_neighbours(1, 1)).to eq 1
    end

    it 'detects neighbour on the top right [1,-1]' do
      earth[2][0].relive!
      expect(earth.alive_neighbours(1,1)).to eq 1
    end
    # end of top row

    # middle row [-1, 0], self, [1, 0]
    it 'detects neighbour on the left [-1, 0]' do
      earth[0][1].relive!
      expect(earth.alive_neighbours(1,1)).to eq 1
    end

    it 'should not detect itself as neighbour nil' do
      earth[1][1].relive!
      expect(earth.alive_neighbours(1,1)).to eq 0
    end

    it 'detects neighbour on the right [1, 0]' do
      earth[2][1].relive!
      expect(earth.alive_neighbours(1,1)).to eq 1
    end
    # end of middle row

    # bottom row [-1, 1], [0, -1], [1, 1]
    it 'detects neighbour on the bottom left [-1, 1]' do
      earth[0][2].relive!
      expect(earth.alive_neighbours(1, 1)).to eq 1
    end

    it 'detects neighbour on the bottom [0, -1]' do
      earth[1][2].relive!
      expect(earth.alive_neighbours(1,1)).to eq 1
    end

    it 'detects neighbour on the bottom right [1, 1]' do
      earth[2][2].relive!
      expect(earth.alive_neighbours(1,1)).to eq 1
    end
    # end of bottom row
  end

  describe '#next!' do
    let(:earth) { GameOfLife::Earth.new(3, 3, false) }

    it 'each cell allowed to receive #neighbour= and #next' do
      cell = double('cell')
      allow(cell).to receive(:bool_to_num).and_return(0)
      allow(cell).to receive(:next!)
      allow(cell).to receive(:neighbours=)

      earth.cells = Array.new(earth.width) do
        Array.new(earth.height) do
          cell
        end
      end

      earth.next!
    end
  end

end

