Redmine::Plugin.register :k_chart do
  name 'K Chart plugin'
  author 'koryo'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/koryokoryo2002/redmine_k_chart'
  permission :k_chart, { :k_chart => :index }, :public => true
  menu :project_menu, :k_chart, { :controller => 'k_chart', :action => 'index' }, :caption => 'k_chart', :after => :activity, :param => :project_id
end
