require 'rails_helper'

RSpec.describe 'application' do
  it 'displays a link to the competitions index' do
    visit '/'
    expect(page).to have_content('B2 Assessment')

    expect(page).to have_link('Competitions Index')
    click_link('Competitions Index')

    expect(current_path).to eq('/competitions')
  end

end
