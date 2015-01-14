class KChartController < ApplicationController
  unloadable

  def index
    @project = Project.find(params[:project_id])
  end

  def velocity
    @project = Project.find(params[:project_id])

    @version_names = []
    @bug_issues_num = []
    @dep_issues_num = []
    idx = 0

    @project.versions.order("effective_date DESC").all.each do|version|
      @version_names.push version.name
      @bug_issues_num.push 0
      @dep_issues_num.push 0
      
      version.fixed_issues.each do|issue|
        if issue.tracker_id == 2
          @dep_issues_num[idx] += 1
        else
          @bug_issues_num[idx] += 1
        end
      end
      idx =+ 1
    end
  end
end
