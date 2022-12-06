require 'rails_helper'

RSpec.describe Team do
  it {should belong_to :division}
  
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

    describe '#division' do
      it 'returns the associated division object' do
        expect(@otters.division).to eq(@a)
      end
    end

    describe '#active_visible' do
      xit 'returns teams where active_team is true' do

      end
    end
    
    describe '#sort_alphabetical' do
      xit 'returns teams in an ascending alphabetical order' do
        
      end
    end

    
  end
end