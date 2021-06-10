require './lib/player'
require './lib/team'
require './lib/world_cup'
require 'rspec'

RSpec.describe Player do
  before :each do
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
  end

  it 'exists' do
    expect(@player).to be_a(Player)
  end

  it 'has readable attributes' do
    expect(@player.name).to eq("Luka Modric")
    expect(@player.position).to eq("midfielder")
  end
end
