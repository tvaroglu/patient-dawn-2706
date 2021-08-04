class Competition < ApplicationRecord

  has_many :competition_teams
  has_many :teams, through: :competition_teams
end
