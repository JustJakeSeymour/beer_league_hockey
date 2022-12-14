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

      @d3_su = Division.create!(name: "D3 South Upper", difficulty: 3, weekends: true)
      @punx = @d3_su.teams.create!(name: "PUNX", won: 6, lost: 2, shootout_loss: 0, active_team: true)
    end

    describe '#teams' do
      it 'returns all associated team objects' do
        expect(@a.teams).to eq([@liquid_death, @smartel, @otters, @bison, @no_longer_a])
        expect(@d3_su.teams).to eq([@punx])
      end
    end

    describe '#team_count' do
      it 'counts the number of teams' do
        expect(@a.team_count).to eq(5)
        expect(@d3_su.team_count).to eq(1)
      end
    end

    describe '#weekend_statement' do
      it 'returns a statement if games are played on weekends or not' do
        expect(@a.weekend_statement).to eq("Games played on weeknights.")
        expect(@d3_su.weekend_statement).to eq("Games played on weekends.")
      end
    end

    describe '#sort_alphabetical' do
      it 'returns teams in an ascending alphabetical order' do
        expect(@a.sort_alphabetical).to eq([@bison, @liquid_death, @no_longer_a, @otters, @smartel])
      end
    end

    describe "#display_wins_over" do
      it 'returns teams with over (n) wins' do
        expect(@a.display_wins_over(3)).to eq([@liquid_death, @smartel])
      end
    end
  end
end