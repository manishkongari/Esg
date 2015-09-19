class ProjectsController < ApplicationController

  def index

  end

  def new
    @project=Project.new
  end

  def create
    raise params.inspect
    @project=Project.new(project_params)
    if @project.save
      flash[:notice] = "Project Added Successfully"
      render :js => "window.location = '#{projects_path}'"
    end

  end

  def edit
    @project=Project.find(params[:id])
  end

  def delete
    @project=Project.find(params[:id])
    @project.destroy
  end

  def show

  end

  def project_params
    params.require(:project).permit(:projectname,:priority,:contract,:salescontact,:engineer,:podate,:buildready,:qcdate,:shipdate,:mtdr,:quicknote)
  end

  def component_type_params

  end

  def component_params

  end
end
