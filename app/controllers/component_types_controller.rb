class ComponentTypesController < ApplicationController

  def new
    @component_type=ComponentType.new
    render layout: 'blank'
  end

  def create
    @component_type=ComponentType.new(component_type_params)
    if @component_type.save
      flash[:notice] = "Component Type Added Successfully"
      render :js => "window.location = '#{component_types_path}'"
    end
  end

  def index
    render layout: 'blank'
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def component_type_list

    if params[:q].length>1
      component_type= ComponentType.where("name like '%#{params[:q]}%'")#
      component_type_list=component_type.collect{|f| [:id=>f.id,:text=>(f.name.to_s)]}.flatten
      render :text=> component_type_list.to_json
    end
  end

  def component_type_params
    params.require(:component_type).permit(:name)
  end
end
