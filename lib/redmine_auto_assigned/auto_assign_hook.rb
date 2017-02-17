 class ViewsLayoutsHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        return stylesheet_link_tag(:main, :plugin => 'redmine_auto_assigned')
      end
 end


 class RedmineAutoAssignedAutoAssignHook < Redmine::Hook::ViewListener
        def controller_issues_new_before_save(context)
            autoset_assigned_to(context)
        end      	  
        def controller_issues_edit_before_save(context)
            autoset_assigned_to(context)
        end        
        def controller_issues_bulk_edit_before_save(context)
            autoset_assigned_to(context)
        end        
        def autoset_assigned_to(context)
           flows = Autoasigned.where(id_project:context[:issue].project_id,id_trackers:context[:issue].tracker_id, id_state: context[:issue].status_id).first
           if flows != nil and context[:issue].assigned_to_id == nil
                context[:issue].assigned_to_id = flows.id_user
           end
        end       
 end
