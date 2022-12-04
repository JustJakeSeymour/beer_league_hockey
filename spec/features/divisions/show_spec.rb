require 'rails_helper'

RSpec.describe "Divisions Show" do
  before:each do
    @a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
    @liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
    @otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
    @bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
    @no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)

    @d3_su = Division.create!(name: "D3 South Upper", difficulty: 3, weekends: true)
    @punx = @d3_su.teams.create!(name: "PUNX", won: 6, lost: 2, shootout_loss: 0, active_team: true)
    @backdoor_bandits = @d3_su.teams.create!(name: "Backdoor Bandits", won: 6, lost: 2, shootout_loss: 0, active_team: true)
    @monkey_wrench = @d3_su.teams.create!(name: "Monkey Wrench", won: 5, lost: 2, shootout_loss: 0, active_team: true)
    @always_dark = @d3_su.teams.create!(name: "#Always Dark", won: 3, lost: 5, shootout_loss: 0, active_team: true)
    @joint_forces = @d3_su.teams.create!(name: "Joint Forces", won: 3, lost: 4, shootout_loss: 0, active_team: true)
    @unhealthy_scratch = @d3_su.teams.create!(name: "Unhealthy Scratch", won: 0, lost: 7, shootout_loss: 0, active_team: true)
  end

  describe "Divisions Show Division Attributes" do
    it "shows the attributes of selected division" do
      visit "/parents/#{@a.id}"
      
      expect(page).to have_content(@a.name)      
      expect(page).to have_content(@a.difficulty)      
    end
  end
  
  describe "Division Teams Count" do
    it "shows the number of teams related to that division" do
      visit "/parents/#{@a.id}"
      
      expect(page).to have_content(@a.team_count)
    end
  end
  
  describe "Division Teams Index Link" do
    it "has a link to division/:id/teams" do
      visit "/divisions/#{@a.id}"
      
      expect(page).to have_link("#{@a.name} teams")
      
      click_link "#{@a.name} teams"
      
      expect(current_path).to eq("/divisions/#{@a.id}/teams")
    end
  end
end