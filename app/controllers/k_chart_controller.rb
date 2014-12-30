class KChartController < ApplicationController
  unloadable

  def index
    @project = Project.find(params[:project_id])
  end

  def velocity
    @project = Project.find(params[:project_id])
  end
end
