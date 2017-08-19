class AiSetupController < ApplicationController
  unloadable
  def index
      @projects  = Project.all
      @states    = IssueStatus.all
      @users  = User.all
      @trackers   = Tracker.all
      #puts @projects
      @flows    = Autoasigned.all.order "id_project desc"
  end

  def change
      id_project  = params[:id_project]
      id_state    = params[:id_state]
      id_user   = params[:id_user]
      id_trackers   = params[:id_trackers]

      #flows = Autoasigned.find_by(id_project: id_project, id_state: id_state)
      flows = Autoasigned.where(id_project: id_project, id_trackers:id_trackers, id_state: id_state).first
      if flows == nil
         flows = Autoasigned.new
         flows.id_project = id_project
         flows.id_state   = id_state
         flows.id_trackers  = id_trackers
         flows.id_user  = id_user
         if flows.save
            flash[:notice] = 'Flow Created.'
         end
         redirect_to :action => 'index'
         return
      end

      flows.id_user = id_user
      if flows.save
            flash[:notice] = 'Flow Updated.'
      end
      redirect_to :action => 'index'
  end


  def delete
     id  = params[:id]
     Autoasigned.destroy(id)
     flash[:notice] = 'Flow Deleted.'
     redirect_to :action => 'index'
  end

  def find
      @flows = Autoasigned.new
  end
end
