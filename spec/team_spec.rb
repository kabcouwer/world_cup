require './lib/player'
require './lib/team'
require './lib/world_cup'
require 'rspec'

RSpec.describe Team do
  before :each do
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  it 'exists' do
    expect(@team).to be_a(Team)
  end

  it 'has readable attributes' do
    expect(@team.country).to eq("France")
  end

  it 'can return if team is eliminted or not' do
    expect(@team.eliminated?).to be(false)

    @team.eliminated = true

    expect(@team.eliminated?).to eq(true)
  end

  it 'returns an empty array of players' do
    expect(@team.players).to eq([])
  end

  it 'can add players' do
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

    expect(@team.players).to eq([@mbappe, @pogba])
  end

  it 'can add players by position' do
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

    expect(@team.players_by_position("midfielder")).to eq([@pogba])
    expect(@team.players_by_position("defender")).to eq([])
  end
end
