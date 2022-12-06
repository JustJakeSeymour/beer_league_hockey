require 'rails_helper'

RSpec.describe "Team Delete" do
  before:each do
    @a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
    @liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
    @bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
    @no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)
  end

  describe "Delete Team" do
    it "Can delete team" do
      # When I visit a child show page
      visit "/teams/#{@liquid_death.id}"
      # Then I see a link to delete the child "Delete Child"
      has_button?("Delete Team")
      # When I click the link
      click_button("Delete Team")
      # Then a 'DELETE' request is sent to '/child_table_name/:id',
      expect(page).to have_current_path("/teams/#{@liquid_death.id}")
      # the child is deleted,
      expect(current_path).to eq("/teams")
      # and I am redirected to the child index page where I no longer see this child
      expect(page).to_not have_content(@liquid_death.name)
      expect(page).to have_content(@otters.name)
    end
  end

  describe "Delete Team from index page" do
    it "can delete team from index" do
      visit "/teams"
      has_button?("Delete Team")
      # When I visit the `child_table_name` index page or a parent `child_table_name` index page
      visit "/division/#{@a.id}/teams"
      has_button?("Delete Team")
      # Next to every child, I see a link to delete that child
      # When I click the link
      # I should be taken to the `child_table_name` index page where I no longer see that child      
    end
  end
end