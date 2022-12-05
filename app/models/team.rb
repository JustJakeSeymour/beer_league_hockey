class Team < ApplicationRecord
  belongs_to :division

  def self.visible
    self.where(active_team: true)
  end
end