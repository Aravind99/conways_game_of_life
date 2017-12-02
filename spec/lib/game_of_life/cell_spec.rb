require_relative '../../spec_helper'

RSpec.describe GameOfLife::Cell do
  context 'methods' do
    let(:cell) { GameOfLife::Cell.new(rand) }

    it 'raise error if input is not valid' do
      expect{GameOfLife::Cell.new('')}.to raise_error(RuntimeError)
    end

    it 'should have #alive #alive= #neighbours #neightbours= methods' do
      expect(cell.respond_to?(:alive)).to be_truthy
      expect(cell.respond_to?(:alive=)).to be_truthy
      expect(cell.respond_to?(:neighbours)).to be_truthy
      expect(cell.respond_to?(:neighbours=)).to be_truthy
    end

    it '#alive? method should return cell state' do
      cell.alive = true
      expect(cell.alive?).to be_truthy
      cell.alive = false
      expect(cell.alive?).to be_falsey
    end

    it '#state method should return its state' do
      cell.alive = true
      expect(cell.bool_to_num).to eq 1
      cell.alive = false
      expect(cell.bool_to_num).to eq 0
    end

    it '#die! method kills cell' do
      cell.die!
      expect(cell.alive?).to be_falsey
    end

    it '#relive method revives cell' do
      cell.relive!
      expect(cell.alive?).to be_truthy
    end
  end

  context '#next!' do
    let(:cell) { GameOfLife::Cell.new(true) }

    it 'live cell dies with fewer than 2 live neighbours' do
      cell.neighbours = 1
      cell.next!
      expect(cell.alive?).to be_falsey
    end

    it 'live cell dies with more than 3 (neighbours > 3) live neighbours' do
      cell.neighbours = 4
      cell.next!
      expect(cell.alive?).to be_falsey
    end

    it 'live cell relives with 2 or 3 live neighbours ' do
      cell.neighbours = 3
      cell.next!
      expect(cell.alive?).to be_truthy
    end

    it 'dead cell relive with more than 3 (neighbours > 3) live neighbours' do
      cell.die!
      cell.neighbours = 4
      cell.next!
      expect(cell.alive?).to be_truthy
    end
  end
end
