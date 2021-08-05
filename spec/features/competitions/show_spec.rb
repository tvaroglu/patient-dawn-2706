require 'rails_helper'

RSpec.describe 'competitions show' do
  # User Story 2 - Competition Show Page
    # As a user
      # When I visit a competition's show page
      # Then I see the competition's name, location, and sport
      # And I see the nickname and hometown of all teams in this competition
      # And I see the average age of all players in the competition
  it 'displays the competitions and attributes' do
    competition = Competition.create!(name: 'PAC12 Championship', location: 'Denver', sport: 'football')

    visit "/competitions/#{competition.id}"
    expect(page).to have_content(competition.name)
    expect(page).to have_content("Location: #{competition.location}")
    expect(page).to have_content("Sport: #{competition.sport.to_s.capitalize}")
  end

  it 'displays all associated team attributes' do
    competition = Competition.create!(name: 'PAC12 Championship', location: 'Denver', sport: 'football')
    team_1 = Team.create!(hometown: 'Boulder', nickname: 'Buffs')
    team_2 = Team.create!(hometown: 'Fort Collins', nickname: 'Rams')
    CompetitionTeam.create!(competition_id: competition.id, team_id: team_1.id)
    CompetitionTeam.create!(competition_id: competition.id, team_id: team_2.id)

    visit "/competitions/#{competition.id}"

    within "#team-#{team_1.id}" do
      expect(page).to have_content("Name: #{team_1.nickname}")
      expect(page).to have_content("Hometown: #{team_1.hometown}")
    end

    within "#team-#{team_2.id}" do
      expect(page).to have_content("Name: #{team_2.nickname}")
      expect(page).to have_content("Hometown: #{team_2.hometown}")
    end
  end

  it 'displays the average age of all players' do
    competition = Competition.create!(name: 'PAC12 Championship', location: 'Denver', sport: 'football')
    team_1 = Team.create!(hometown: 'Boulder', nickname: 'Buffs')
    team_2 = Team.create!(hometown: 'Fort Collins', nickname: 'Rams')
    player_1 = team_1.players.create!(name: 'Player 1', age: 20)
    player_2 = team_1.players.create!(name: 'Player 2', age: 19)
    player_3 = team_2.players.create!(name: 'Player 3', age: 21)
    player_4 = team_2.players.create!(name: 'Player 4', age: 22)
    CompetitionTeam.create!(competition_id: competition.id, team_id: team_1.id)
    CompetitionTeam.create!(competition_id: competition.id, team_id: team_2.id)

    visit "/competitions/#{competition.id}"

    expect(page).to have_content("Average Player Age: #{competition.average_player_age}")
  end

end
