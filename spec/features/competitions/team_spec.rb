require 'rails_helper'

RSpec.describe 'competitions team creation' do
  # User Story 3 - Register a Team
    # As a user
    # When I visit a competition's show page
    # Then I see a link to register a new team
    # When I click this link
    # Then I am taken to a new page where I see a form
    # When I fill in this form with a team's hometown and nickname
    # And I click submit
    # Then I am redirected back to the competition's show page
    # And I see the new team I created listed
  it 'displays a form to add a team to a competition' do
    competition = Competition.create!(name: 'PAC12 Championship', location: 'Denver', sport: 'football')
    team = Team.create!(nickname: 'Blue Devils', hometown: 'Raleigh')

    visit "/competitions/#{competition.id}"
    expect(page).to_not have_content(team.nickname)
    expect(page).to_not have_content(team.hometown)

    expect(page).to have_content("New Team Registration:")
    fill_in 'Team Name', with: team.nickname
    fill_in 'Team Location', with: team.hometown
    click_button 'Save'
    expect(current_path).to eq("/competitions/#{competition.id}")

    visit "/competitions/#{competition.id}"
    expect(page).to have_content(team.nickname)
    expect(page).to have_content(team.hometown)
  end

end
