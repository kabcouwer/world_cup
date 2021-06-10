
class WorldCup
  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    active_players = []
    @teams.each do |team|
      if team.eliminated == false
        active_players << team.players_by_position(position)
      end
    end
    active_players.flatten
  end

  def all_players_by_position
    positions = Hash.new {|hash, key| hash[key] = []}
    @teams.find_all do |team|
      team.players.find_all do |player|
        positions[player.position] << player
      end
    end
    positions
  end
end
