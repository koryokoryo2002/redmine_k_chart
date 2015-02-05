class KChartController < ApplicationController
  unloadable

  def index
    @project = Project.find(params[:project_id])
  end

  def velocity
    @project = Project.find(params[:project_id])

    @version_names = []
    @issues_cnt_info = {}

    @project.versions.limit(10).order("effective_date DESC").all.each do|version|
      @version_names.push version.name

      issues_cnt_per_tracker = []
      
      version.fixed_issues.each do|issue|
        issues_cnt_per_tracker[issue.tracker_id] = 0 if issues_cnt_per_tracker[issue.tracker_id] == nil
        issues_cnt_per_tracker[issue.tracker_id] += 1
      end

      issues_cnt_per_tracker.each_with_index do |cnt, idx|
        if Tracker.find_by_id(idx) != nil
          @issues_cnt_info[idx] = [] unless @issues_cnt_info.has_key?(idx)
          @issues_cnt_info[idx] << cnt
        end
      end
    end
  end
end
