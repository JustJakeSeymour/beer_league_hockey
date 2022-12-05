class Team < ApplicationRecord
  belongs_to :division

  def self.active_visible
    self.where(active_team: true)
  end
  
  def self.sort_alphabetical(division_id)
    self.where(division_id: division_id).order(name: :asc)
  end
end