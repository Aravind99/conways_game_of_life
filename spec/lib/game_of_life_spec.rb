require 'spec_helper'

RSpec.describe GameOfLife do
  it 'has a version number' do
    expect(GameOfLife::VERSION).not_to be nil
  end

  it 'has a constant named Earth' do
    expect(GameOfLife.constants).to include :Earth
  end
end
