require 'rails_helper'

RSpec.describe 'competitions index' do
  it 'displays all competitions and attributes' do
    competition = Competition.create!(name: 'PAC12 Championship', location: 'Denver', sport: 'football')

    visit '/competitions'
    expect(page).to have_content('All Competitions')

    within "#competition-#{competition.id}" do
      expect(page).to have_link(competition.name)
      click_on(competition.name)
      expect(current_path).to eq("/competitions/#{competition.id}")
    end
  end

end
