class TeamsController < ApplicationController
  def index
    @teams = Team.active_visible
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end
  
  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to "/teams/#{team.id}"
  end

  def destroy
    Team.destroy(params[:id])
    redirect_to "/teams"
  end

private

  def team_params
    params.permit(:name, :won, :lost, :shootout_loss, :active_team)
  end
end