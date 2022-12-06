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
      # Then I see a link to delete the child "Delete Child"
      # When I click the link
      # Then a 'DELETE' request is sent to '/child_table_name/:id',
      # the child is deleted,
      # and I am redirected to the child index page where I no longer see this child
    end
  end

  describe "Delete Team from index page" do
    it "can delete team from index" do
      # When I visit the `child_table_name` index page or a parent `child_table_name` index page
      # Next to every child, I see a link to delete that child
      # When I click the link
      # I should be taken to the `child_table_name` index page where I no longer see that child      
    end
  end
end