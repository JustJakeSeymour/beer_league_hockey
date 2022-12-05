require 'rails_helper'

RSpec.describe "Division Team Creation" do
  before:each do
    @a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
    @liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
    @bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
    @no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)
  end

  describe "link to new division team page" do 
    it "has a link from a division team page" do
      # When I visit a Parent Children Index page
      visit "/divisions/#{@a.id}/teams"
      # Then I see a link to add a new adoptable child for that parent "Create Child"
      has_link?("Create Team")
      # When I click the link
      click_link("Create Team")
      # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
      expect(current_path).to eq("/divisions/#{@a.id}/teams/new")
    end
  end
  
  describe "fill out form with new team's attributes" do
    it "accepts new team attributes" do
      visit "/divisions/#{@a.id}/teams/new"
      # When I fill in the form with the child's attributes:
      has_field?("Name")
      has_field?("Won")
      has_field?("Lost")
      has_field?("Shootout Loss")
      has_field?("Active Team")
      has_button?("Create Team")
      # And I click the button "Create Child"
    end
  end
  
  describe "post goes to division teams page, with new team" do
    it "creates a new team" do
      visit "/divisions/#{@a.id}/teams/new"

      fill_in("Name", with: "Mighty Ducks")
      fill_in("Won", with: 4)
      fill_in("Lost", with: 4)
      fill_in("shootout_loss", with: 0)
      choose(option: 'true')

      click_button("Create Team")
      
      expect(current_path).to eq("/divisions/#{@a.id}/teams")
      
      visit "/divisions/#{@a.id}/teams"
      expect(page).to have_content("Mighty Ducks")      
    end
  end
end