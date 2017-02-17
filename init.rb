require 'redmine'
require_dependency 'redmine_auto_assigned/auto_assign_hook'

Redmine::Plugin.register :redmine_auto_assigned do
  name 'Automates issue assignment during state change'
  author 'Juan Jose Rosales Rodriguez'
  description '----'
  version '0.0.1'
  permission :ai_setup, { :ai_setup => [:index, :change] }, :public => true
  menu :admin_menu, :automatic_assignments, {:controller => 'ai_setup', :action => 'index'}, :caption => 'Automatic Issue Assignments'
end
