class Division < ApplicationRecord
  has_many :teams, dependent: :destroy

  def team_count
    teams.count
  end
end