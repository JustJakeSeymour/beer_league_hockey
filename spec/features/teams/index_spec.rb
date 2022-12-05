require 'rails_helper'

RSpec.describe "Teams Index" do
  before:each do
    @a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
    @liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
    @bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
    @no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)
  end

  describe "Teams Index shows all Teams & Attributes" do
    it "shows all teams & team attributes" do
      visit '/teams'

      expect(page).to have_content(@liquid_death.name)
      expect(page).to have_content(@otters.name)
      expect(page).to have_content(@liquid_death.won)
      expect(page).to have_content(@otters.lost)
      expect(page).to have_content(@bison.shootout_loss)
    end
  end
  
  describe "Teams Index Link" do
    it "has a link to teams index on many pages" do
      visit "/divisions"
      # When I visit any page on the site
      expect(page).to have_link("Teams")
      # Then I see a link at the top of the page that takes me to the Child Index
      visit "/divisions/#{@a.id}"
      expect(page).to have_link("Teams")
      visit "/divisions/#{@a.id}/teams"
      expect(page).to have_link("Teams")

      click_link "Teams"
      expect(current_path).to eq("/teams")
    end
  end
  
  describe "Teams Index only shows true" do
    it "only displays teams where 'active_team' is true" do
      visit "/teams"

      expect(page).to have_content(@liquid_death.name)
      expect(page).to have_content(@otters.name)
      expect(page).to_not have_content(@no_longer_a.name)
    end
  end
end