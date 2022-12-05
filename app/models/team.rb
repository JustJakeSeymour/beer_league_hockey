class Team < ApplicationRecord
  belongs_to :division

  def visible
    self.where("active_team = 'true'")
  end
  
end