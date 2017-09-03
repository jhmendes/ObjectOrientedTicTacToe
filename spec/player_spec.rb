require 'spec_helper'


describe Player do
  it 'has an x character' do
    player = Player.new('x')
    expect(player).to eq(player)
  end

  it "has an o character" do
    player = Player.new('o')
    expect(player).to eq(player)
  end
end
