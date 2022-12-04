require 'rails_helper'

RSpec.describe "Division Index" do
  before:each do
    @a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
    @liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
    @bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
    @no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)
  end
  
  describe "name of each division" do
    it 'displays the name of each division' do
      visit '/divisions'

      expect(page).to have_content(@a.name)
    end
  end

  describe "names sorted by most recent first" do
    it 'orders records by most recent first' do
      @d2_mw = Division.create!(name: "D2 Mon/Wed", difficulty: 2, weekends: false)
      visit '/divisions'
      
      expect(@d2_mw.name).to appear_before(@a.name)
      expect(page).to have_content(@d2_mw.created_at)
    end
  end

  describe "link to '/divisions'" do
    it 'has a link to /divisions on multiple pages' do
      # When I visit any page on the site
      visit "/teams"
      # Then I see a link at the top of the page that takes me to the Parent Index
      expect(page).to have_link("Divisions")
      visit "/divisions/#{@a.id}"
      expect(page).to have_link("Divisions")
      visit "/divisions/#{@a.id}/teams"
      expect(page).to have_link("Divisions")

      click_link "Divisions"
      expect(current_path).to eq("/divisions")
    end
  end
end