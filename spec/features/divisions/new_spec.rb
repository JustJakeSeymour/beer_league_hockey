require 'rails_helper'

RSpec.describe "Division Creation" do
  before:each do
    @a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
    @liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
    @bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
    @no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)
  end

  describe "link to new division page" do
    it "has a link to new division from division index" do
      # When I visit the Parent Index page
      visit '/divisions'

      # Then I see a link to create a new Parent record, "New Parent"
      expect(page).to have_link("New Division")
      # When I click this link
      click_link "New Division"
      # Then I am taken to '/parents/new' where I  see a form for a new parent record
      expect(current_path).to eq("/divisions/new")
    end
  end

  describe "form fill out" do
    it "has a form for new division attributes, submits to divisions" do
      visit "/division/new"
      # When I fill out the form with a new parent's attributes:
      has_field?("name")
      fill_in "name", with: "Pro"
      has_field?("weekends")
      choose(option: 'true')
      has_field?("difficulty")
      fill_in "difficulty", with: 1
      # And I click the button "Create Parent" to submit the form
      has_button?("submit")
      # Then a `POST` request is sent to the '/parents' route,
    end
  end
  
  describe "redirects to '/divisions' with new entry" do
    it "creates a new division and redirects to divisions" do
      visit "/divisions/new"
      # a new parent record is created,
      fill_in('Name', with: "Pros")
      fill_in('Difficulty', with: 1)
      choose(option: 'true')
      click_button "Create Division"
      # and I am redirected to the Parent Index page where I see the new Parent displayed.
      expect(current_path).to eq("/divisions")

      visit "/divisions"
      expect(Division.last.name).to appear_before(@a.name)
    end
  end
end