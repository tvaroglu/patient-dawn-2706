require 'rails_helper'

RSpec.describe 'competitions index' do
  # User Story 1 - Competition Index
    # As a user
      # When I visit the competion index
      # Then I see the names of all competitions
      # Each competition name links to its show page
  it 'displays all competitions and links to show pages' do
    competition_1 = Competition.create!(name: 'PAC12 Championship', location: 'Denver', sport: 'football')
    competition_2 = Competition.create!(name: 'March Madness', location: 'Houston', sport: 'basketball')

    visit '/competitions'
    expect(page).to have_content('All Competitions')

    within "#competition-#{competition_1.id}" do
      expect(page).to have_link(competition_1.name)
      click_on(competition_1.name)
      expect(current_path).to eq("/competitions/#{competition_1.id}")
    end

    visit '/competitions'
    within "#competition-#{competition_2.id}" do
      expect(page).to have_link(competition_2.name)
      click_on(competition_2.name)
      expect(current_path).to eq("/competitions/#{competition_2.id}")
    end
  end

end
