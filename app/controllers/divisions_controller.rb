class DivisionsController < ApplicationController
  def index
    @divisions = Division.all
  end

  def show
    @division = Division.find(params[:id])
  end

  def new
  end

  def create
    Division.create(division_params)
    redirect_to "/divisions"
  end

private
  def division_params
    params.permit(:name, :difficulty, :weekends)
  end
  
end