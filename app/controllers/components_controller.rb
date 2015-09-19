class ComponentsController < ApplicationController

  def edit
    @component=Component.find(params[:id])
  end

  def update
    @component=Component.find(params[:id])
    if @component.update_attributes(component_params)
      render :js => "window.location = '#{edit_project_path(@component.project_id)}'"
    end
  end

  def component_params
    params.require(:component).permit(:component_type_id,:partno,:desc,:manuf,:qty)
  end
end
