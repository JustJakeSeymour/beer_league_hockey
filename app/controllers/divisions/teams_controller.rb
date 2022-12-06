class Divisions::TeamsController < ApplicationController
  def index
    @division = Division.find(params[:id])
    @teams = @division.teams
    
    if params[:sort]
      @teams = Team.sort_alphabetical(@division.id)
    else
      
    end

    if params[:wins_over]
      @teams = Team.display_wins_over(params[:wins_over], @division.id)
    else
    end
  end
  
  def new
    @division = Division.find(params[:id])
  end
  
  def create
    division = Division.find(params[:division_id])
    new_team = division.teams.create!(division_teams_params)
  end
  
  private
  
  def division_teams_params
    params.permit(:name, :won, :lost, :shootout_loss, :active_team, :division_id)
  end
end