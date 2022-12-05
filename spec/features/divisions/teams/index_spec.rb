require 'rails_helper'

RSpec.describe "Division Team Index" do
  before:each do
    @a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
    @liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
    @bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
    @no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)
  end

  describe "view division teams index" do
    it "displays each team in division with team attributes" do
      visit "/divisions/#{@a.id}/teams"

      expect(page).to have_content(@liquid_death.name)
      expect(page).to have_content(@otters.name)
      expect(page).to have_content(@liquid_death.won)
      expect(page).to have_content(@otters.lost)
      expect(page).to have_content(@bison.shootout_loss)
    end
  end
end