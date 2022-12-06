class Division < ApplicationRecord
  has_many :teams, dependent: :destroy

  def team_count
    teams.count
  end

  def self.sort_created
    order({ created_at: :desc })
  end

  def weekend_statement
    if self.weekends
      "Games played on weekends."
    else
      "Games played on weeknights."
    end
  end

  def display_wins_over(number)
    teams.where("won > #{number}").order(won: :desc)
  end

  def sort_alphabetical
    teams.order(:name)
  end
end