class DivisionTeamsController < ApplicationController
  def index
    @division = Division.find(params[:id])
    @teams = @division.teams
  end
  
  def new
    @division = Division.find(params[:id])
  end

  def create
    division = Division.find(params[:division_id])
    new_team = division.teams.create(division_teams_params)
  end

private

  def division_teams_params
    params.permit(:name, :won, :lost, :shootout_loss, :active_team, :division_id)
  end
end