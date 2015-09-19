class ComponentsController < ApplicationController

  before_action :check_current_user, :only => [:update,:destroy,:edit]
  def edit

  end

  def destroy

    @component.destroy
    flash[:notice] = "Component Deleted Successfully"
    render :js => "window.location.reload();"
  end

  def update
    @component=Component.find(params[:id])
    @component.update_attributes(:component_type_id=>params.try(:[],:component).try(:[],:component_type_id),
    :partno=>params.try(:[],:component).try(:[],:partno)[0],
    :desc=>params.try(:[],:component).try(:[],:desc)[0],
    :manuf=>params.try(:[],:component).try(:[],:manuf)[0],
    :qty=>params.try(:[],:component).try(:[],:qty)[0])
    if @component.save
      render :js => "window.location = '#{edit_project_path(@component.project_id)}'"
    end
  end


  def check_current_user
    @component=Component.find(params[:id])

    unless @component.try(:project).try(:user_id)==current_user.id
      flash[:alert] = "Page that you tried visit is not accessible"
      redirect_to root_path
    end
  end

  def component_params
    params.require(:component).permit(:component_type_id,:partno,:desc,:manuf,:qty)
  end
end
