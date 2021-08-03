require 'rails_helper'

RSpec.describe Player do
  describe 'relationships' do
    it { should belong_to(:team) }
  end
end
