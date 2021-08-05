require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:competition_teams) }
    it {should have_many(:teams).through(:competition_teams)}
  end

  describe 'methods' do
    it 'can return the average age for all players in a competition' do
      team_1 = Team.create!(hometown: 'Boulder', nickname: 'Buffs')
      team_2 = Team.create!(hometown: 'Fort Collins', nickname: 'Rams')

      player_1 = team_1.players.create!(name: 'Player 1', age: 20)
      player_2 = team_1.players.create!(name: 'Player 2', age: 19)
      player_3 = team_2.players.create!(name: 'Player 3', age: 21)
      player_4 = team_2.players.create!(name: 'Player 4', age: 22)

      competition = Competition.create!(name: 'PAC12 Championship', location: 'Denver', sport: 'football')

      CompetitionTeam.create!(competition_id: competition.id, team_id: team_1.id)
      CompetitionTeam.create!(competition_id: competition.id, team_id: team_2.id)

      expect(competition.average_player_age).to eq(((player_1.age + player_2.age + player_3.age + player_4.age) / 4.to_f))
    end
  end

end
