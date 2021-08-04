class Competition < ApplicationRecord

  has_many :competition_teams
  has_many :teams, through: :competition_teams

  def player_statistics
    teams.joins(:players)
    .select("COUNT(players.*) AS total_player_count, SUM(players.age) AS total_player_age")
    .group(:id)
  end

  def average_player_age
    player_statistics.sum {|team| team.total_player_age}.to_f / player_statistics.sum {|team| team.total_player_count}
  end

end
