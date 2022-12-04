class Division < ApplicationRecord
  has_many :teams, dependent: :destroy

  def team_count
    teams.count
  end

  def weekend_statement
    if :weekends
      "Games played on weekends."
    else
      "games Played on weeknights."
    end
  end
end