require 'rails_helper'

RSpec.describe Division do
  it {should have_many :teams}
  
  describe 'instance methods' do
    before:each do
      @a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
      @liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
      @smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
      @otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
      @bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
      @no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)
    end

    describe '#teams' do
      it 'returns all associated team objects' do
        expect(@a.teams).to eq([@liquid_death, @smartel, @otters, @bison, @no_longer_a])
      end
    end

    describe '#team_count' do
      it 'counts the number of teams' do
        expect(@a.team_count).to eq(5)
      end
    end
  end
end