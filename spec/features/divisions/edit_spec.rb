require 'rails_helper'

RSpec.describe "Division Update" do
  before:each do
    @a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
    @liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
    @bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
    @no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)
  end

  describe "link from '/divisions/:id to edit" do
    it "has a link from divisions show for update" do
      visit "/divisions/#{@a.id}"
      
      expect(page).to have_link "Update Division"

      click_link "Update Division"
      
      expect(current_path).to eq("/divisions/#{@a.id}/edit")
    end
  end

  describe "fill out the form with updated information" do
    it "has a form to update information" do
      visit "/divisions/#{@a.id}/edit"
      
      has_field?("Name")
      fill_in("Name", with: "Learn To Play")
      
      has_field?("Difficulty")
      fill_in("Difficulty", with: 5)
      
      has_field?("Weekends")
      choose(option: 'true')

      has_button?("Submit")
    end
  end
  
  describe "submit redirects to division show page with updated information" do
    it "redirects with updated information on page" do
      visit "/divisions/#{@a.id}/edit"
      fill_in("Name", with: "Learn To Play")
      fill_in("Difficulty", with: 5)
      choose(option: 'true')
      click_button("Update Division")

      expect(current_path).to eq("/divisions/#{@a.id}")

      visit "/divisions/#{@a.id}"

      expect(page).to have_content("Learn To Play")
    end
  end

  describe "division update from divisions page" do
    it "has link to update division from divisions page" do
      visit "/divisions"
      has_button?("Update #{@a.name} Info")
      click_button("Update #{@a.name} Info")
      expect(current_path).to eq("/divisions/#{@a.id}/edit")
    end
  end
end