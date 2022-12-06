class Team < ApplicationRecord
  belongs_to :division

  def self.active_visible
    self.where(active_team: true)
  end
end