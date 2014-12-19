class KChartController < ApplicationController
  unloadable


  def index
    @project = Project.find(params[:project_id])
  end
end
