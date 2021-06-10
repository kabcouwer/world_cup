class Team
  attr_accessor :eliminated
  attr_reader :team,
              :country,
              :players

  def initialize(country)
    @country = country
    @players = []
    @eliminated = false
  end

  def add_player(player)
    @players << player
  end

  def eliminated?
    @eliminated
  end

  def players_by_position(position)
    @players.find_all do |player|
      player.position == position
    end
  end

end
