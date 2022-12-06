require 'rails_helper'

RSpec.describe "Division Delete" do
  before:each do
    @a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
    @liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
    @bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
    @no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)

    @w = Division.create!(name: "Women's", difficulty: 1, weekends: true)
    @pigeons = @w.teams.create!(name: "Pigeons", won: 4, lost: 1, shootout_loss: 2, active_team: true)
    @drunk_dragons = @w.teams.create!(name: "Drunk Dragons", won: 4, lost: 2, shootout_loss: 0, active_team: true)
    @harley_quinns = @w.teams.create!(name: "Harley Quinns", won: 2, lost: 2, shootout_loss: 3, active_team: true)
    @tomb_raiders = @w.teams.create!(name: "Tomb Raiders", won: 2, lost: 4, shootout_loss: 0, active_team: true)
    @squad = @w.teams.create!(name: "Squad", won: 1, lost: 4, shootout_loss: 1, active_team: true)
    @tbd_w = @w.teams.create!(name: "Women's TBD", won: 0, lost: 5, shootout_loss: 1, active_team: false)
  end

  describe "Delete Division" do
    it "Can delete division" do
      # When I visit a parent show page
      visit "/divisions/#{@a.id}"
      # Then I see a link to delete the parent
      has_button?("Delete Division")
      # When I click the link "Delete Parent"
      click_button("Delete Division")
      # Then a 'DELETE' request is sent to '/parents/:id',
      expect(current_path).to eq("/divisions")
      # the parent is deleted, and all child records are deleted
      expect(page).to_not have_content(@a.name)
      expect(page).to have_content(@w.name)
      visit "/teams"
      expect(page).to_not have_content(@smartel.name)
      expect(page).to have_content(@pigeons.name)
      # and I am redirected to the parent index page where I no longer see this parent
    end
  end
  
  describe "Delete button from divisions index" do
    it "deletes a division from the index" do
      visit "/divisions"
      has_button?("Delete Division")
      # I am returned to the Parent Index Page where I no longer see that parent
    end
  end

end