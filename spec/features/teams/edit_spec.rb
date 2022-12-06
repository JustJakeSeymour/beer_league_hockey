require 'rails_helper'

RSpec.describe "Teams Update" do
  before:each do
    @a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
    @liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
    @bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
    @no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)
  end

  describe "Update Team link from Team Show page" do
    it "has a link to update" do
      visit "/teams/#{@otters.id}"

      has_link?("Update Team")
      click_link("Update Team")

      expect(current_path).to eq("/teams/#{@otters.id}/edit")
    end
  end

  describe "edit attributes and submit" do
    it "has attribute forms to update" do
      visit "/teams/#{@otters.id}/edit"
      
      has_field?("Name")
      has_field?("Won")
      has_field?("Lost")
      has_field?("Shootout Loss")
      has_field?("Active Team")
      has_button?("Update Team")
    end
  end
  
  
  describe "updates Team and redirects to show page" do 
    it "has a path request and redirects to Teams show page" do
      visit "/teams/#{@otters.id}/edit"
      fill_in("Name", with: "Mighty Ducks")
      fill_in("Won", with: 4)
      fill_in("Lost", with: 4)
      fill_in("shootout_loss", with: 0)
      choose(option: 'true')

      click_button("Update Team")
    
      expect(current_path).to eq("/teams/#{@otters.id}")

      visit "/teams/#{@otters.id}"

      expect(page).to have_content("Mighty Ducks")      
      expect(page).to_not have_content("Otters")
    end
  end

  describe "team update from teams page" do
    it "has link to update team from teams page" do
      visit "/teams"
      has_button?("Update #{@otters.name} Info")
      click_button("Update #{@otters.name} Info")
      expect(current_path).to eq("/teams/#{@otters.id}/edit")
      
      visit "/divisions/#{@a.id}/teams"
      has_button?("Update #{@otters.name} Info")
      click_button("Update #{@otters.name} Info")
      expect(current_path).to eq("/teams/#{@otters.id}/edit")
    end
  end
  
end