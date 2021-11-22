class Autoasigned < ActiveRecord::Base
  def autoassigned_params
    params.require(:autoassigned).permit(:project, :state,:user)
  end
end
