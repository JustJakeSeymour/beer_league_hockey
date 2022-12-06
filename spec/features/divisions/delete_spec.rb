require 'rails_helper'

RSpec.describe "Division Delete" do
  before:each do
    @a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
    @liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
    @bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
    @no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)
  end

  describe "Delete Division" do
    it "Can delete division" do
      # When I visit a parent show page
      # Then I see a link to delete the parent
      # When I click the link "Delete Parent"
      # Then a 'DELETE' request is sent to '/parents/:id',
      # the parent is deleted, and all child records are deleted
      # and I am redirected to the parent index page where I no longer see this parent
    end
  end

  describe "Delete button from divisions index" do
    it "deletes a division from the index" do
      # When I visit the parent index page
      # Next to every parent, I see a link to delete that parent
      # When I click the link
      # I am returned to the Parent Index Page where I no longer see that parent
    end
  end

end