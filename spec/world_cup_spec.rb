require './lib/player'
require './lib/team'
require './lib/world_cup'
require 'rspec'

RSpec.describe WorldCup do
  before :each do
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)
    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  it 'exists' do
    expect(@world_cup).to be_a(WorldCup)
  end

  it 'has readable attributes' do
    expect(@world_cup.year).to eq(2018)
    expect(@world_cup.teams).to eq([@france, @croatia])
  end

  it 'returns active players by positions' do
    expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba, @modric])
  end

  it 'returns active players by positions after elimination' do
    @croatia.eliminated = true

    expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba])
  end

  it 'can return a hash of all players and their position' do
    expect(@world_cup.all_players_by_position).to eq({
      "forward" => [@mbappe],
      "midfielder" => [@pogba, @modric],
      "defender" => [@vida]
      })
  end
end
