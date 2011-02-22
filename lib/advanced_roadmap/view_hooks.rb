module AdvancedRoadmap
  class ViewHooks < Redmine::Hook::ViewListener
    render_on(:view_projects_show_sidebar_bottom,
              :partial => "hooks/milestones")
    render_on(:view_issues_sidebar_planning_bottom,
              :partial => "hooks/milestones")
  end
end