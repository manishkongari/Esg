class ProjectsController < ApplicationController
  before_action :check_current_user,:only => [:edit,:update,:destroy]
  before_action :templates,:only => [:new]
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
      flash[:alert] = "Page that you tried to visit is not accessible"
      redirect_to root_path
    end
  end

  def destroy

    @project.destroy
    flash[:notice] = "Project Deleted Successfully"
    render :js => "window.location.reload();"
  end

  def templates

    if params[:template_id].present?
      if params[:template_id]!="0"

        #VFD PANEL
        if params[:template_id]=="1"
          @template_type="VFD Panel"
          @component_types=ComponentType.where({name:["Enclosure","Disconnect Switch","Circuit Protection","Pilot Devices",
                                               "Power Supply","Terminal Block","Panel-Mount Receptacles",
                                               "VFD","VFD Remote Display","Bypass Contactor","External Encoder"]})
        end

        #HMI/PLC Panel
        if params[:template_id]=="2"
          @template_type="HMI/PLC Panel"
          @component_types=ComponentType.where({name:["Enclosure","Disconnect Switch","Circuit Protection","Pilot Devices",
                                                      "Power Supply","Terminal Block","Panel-Mount Receptacles",
                                                     "PLC-CPU","PLC Modules-Digital Inputs","PLC Modules-Digital Outputs",
                                               "PLC Modules-Analog Inputs","PLC Modules-Analog Outputs","PLC Modules-Speciality",
                                               "HMI","HMI Communication","VFD/Servo/Stepper Drives","Safety Relay"]})
        end

        #Servo/Stepper Panel
        if params[:template_id]=="3"
          @template_type="Servo/Stepper Panel"
          @component_types=ComponentType.where({name:["Enclosure","Disconnect Switch","Circuit Protection","Pilot Devices",
                                                      "Power Supply","Terminal Block","Panel-Mount Receptacles",
                                                      "Servo/Stepper","Power Cables","Feedback Cables","External Encoders"]})
        end

        #Display Panel
        if params[:template_id]=="4"
          @template_type="Display Panel"
          @component_types=ComponentType.where({name:["Enclosure","Disconnect Switch","Circuit Protection","Pilot Devices",
                                                      "Power Supply","Terminal Block","Panel-Mount Receptacles",
                                                      "Display"]})

        end

        #wireless Panel
        if params[:template_id]=="5"
          @template_type="Wireless Panel"
          @component_types=ComponentType.where({name:["Enclosure","Disconnect Switch","Circuit Protection","Pilot Devices",
                                                      "Power Supply","Terminal Block","Panel-Mount Receptacles",
                                                      "Solar Panels","Battery Pack","Nodes Transmitter","Nodes Receiver"]})

        end

        #Cables
        if params[:template_id]=="6"
          @template_type="Cables"
          @component_types=ComponentType.where({name:["Crimp Tool","Multi-Conductor Cables","Wire Guage","Shielding",
                                                      "Connectors-Male","Connectors-Female","Pins","Sockets","Heat Shrink"]})

        end


      end
    end
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
