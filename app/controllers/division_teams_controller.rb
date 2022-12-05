class DivisionTeamsController < ApplicationController
  def index
    @division = Division.find(params[:id])
    @teams = @division.teams
  end
end