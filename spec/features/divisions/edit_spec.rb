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
      # When I visit a parent show page
      # Then I see a link to update the parent "Update Parent"
      # When I click the link "Update Parent"
      # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    end
  end

  describe "fill out the form with updated information" do
    it "has a form to update information" do
      # When I fill out the form with updated information
      # And I click the button to submit the form

      # Then a `PATCH` request is sent to '/parents/:id',
    end
  end

  describe "submit redirects to division show page with updated information" do
    it "redirects with updated information on page" do
      # the parent's info is updated,
      # and I am redirected to the Parent's Show page where I see the parent's updated info
    end
  end
end