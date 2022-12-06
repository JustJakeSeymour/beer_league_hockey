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
  
  describe "button to toggle alphabetical" do
    it "has a button to toggle alphabetical order" do
      visit "/divisions/#{@a.id}/teams"
      # Then I see a link to sort children in alphabetical order
      has_link?("Sort Alphabetical")
      # When I click on the link
      click_link("Sort Alphabetical")
      # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
      expect(current_path).to eq("/divisions/#{@a.id}/teams")
      expect(@bison.name).to appear_before(@otters.name)
    end
  end

  describe "Display over given threshold" do
    it "displays teams with over 'n' of wins" do
      # When I visit the Parent's children Index Page
      visit "/divisions/#{@a.id}/teams"
      # I see a form that allows me to input a number value
      expect(page).to have_content("Only return records with more than")
      # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
      fill_in :wins_over, with: 3
      # Then I am brought back to the current index page with only the records that meet that threshold shown.      
      expect(page).to have_current_path("/divisions/#{@a.id}/teams?wins_over=3")
      expect(page).to have_content(@liquid_death.name)
      expect(page).to have_content(@smartel.name)
      expect(page).to_not have_content(@bison.name)
    end
  end
end