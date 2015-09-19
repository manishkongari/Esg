class ProjectsController < ApplicationController
 before_action :check_current_user,:only => [:edit,:update,:destroy]
  def index
    @projects=Project.all
  end

  def users_projects
    @projects=Project.where("user_id = ?",current_user.id)

  end

  def new
    @project=Project.new

  end

  def create

    @project=Project.new(project_params.merge(:user_id=>current_user.try(:id)))
    if @project.save
      params.try(:[],:component).try(:[],:component_type_id).to_a.each_with_index do |component,index|
        @project.components.create(:component_type_id=>component,
                                   :partno=>params.try(:[],:component).try(:[],:partno)[index],
                                   :desc=>params.try(:[],:component).try(:[],:desc)[index],
                                   :manuf=>params.try(:[],:component).try(:[],:manuf)[index],
                                   :qty=>params.try(:[],:component).try(:[],:qty)[index])
      end

      flash[:notice] = "Project Added Successfully"
      render :js => "window.location = '#{projects_path}'"
    end

  end

  def edit


  end

  def update

    @project.update_attributes(project_params)

    if @project.save
      params.try(:[],:component).try(:[],:component_type_id).to_a.each_with_index do |component,index|
        @project.components.create(:component_type_id=>component,
                                   :partno=>params.try(:[],:component).try(:[],:partno)[index],
                                   :desc=>params.try(:[],:component).try(:[],:desc)[index],
                                   :manuf=>params.try(:[],:component).try(:[],:manuf)[index],
                                   :qty=>params.try(:[],:component).try(:[],:qty)[index])
      end

      flash[:notice] = "Project updated Successfully"
      render :js => "window.location = '#{projects_path}'"
    end

  end

  def show
    @project=Project.find(params[:id])
  end

  def check_current_user
    @project=Project.find(params[:id])

    unless @project.try(:user_id)==current_user.id
      flash[:alert] = "Page that you tried visit is not accessible"
      redirect_to root_path
    end
  end

  def destroy

    @project.destroy
    flash[:notice] = "Project Deleted Successfully"
    render :js => "window.location.reload();"
  end

  def project_params
    params.require(:project).permit(:projectname,:priority,:contract,:salescontact,:engineer,:podate,:buildready,:qcdate,:shipdate,:mtdr,:quicknote)
  end


  def component_update
    @component=ComponentType.find(params[:value].to_i)
  end

  def component_params
    params.require(:component).permit(:partno,:desc,:manuf,:qty)
  end
end
