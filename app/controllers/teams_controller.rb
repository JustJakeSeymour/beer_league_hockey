class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    team_visible = Team.where(:active_team = true)
  end

  def edit
    @team = Team.find(params[:id])
  end
  
  def update
    team = Team.find(params[:id])
    team.update(team_params)
  end

private

  def team_params
    params.permit(:name, :won, :lost, :shootout_loss, :active_team)
  end
end