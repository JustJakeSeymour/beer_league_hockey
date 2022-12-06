class Team < ApplicationRecord
  belongs_to :division

  def self.active_visible
    self.where(active_team: true)
  end
  
  # def self.sort_alphabetical(division_id)
  #   self.where(division_id: division_id).order(:name)
  # end

  # def self.display_wins_over(number, division_id)
  #   self.where(division_id: division_id).where("won > #{number}").order(won: :desc)
  # end
end