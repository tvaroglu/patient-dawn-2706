class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  has_many :competition_teams
  has_many :competitions, through: :competition_teams

end
