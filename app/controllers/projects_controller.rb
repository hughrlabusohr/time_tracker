class ProjectsController < ApplicationController
  before_action :logged_in?
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: 'Project was succesfully created.'
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @project.destroy
      redirect_to projects_url, notice: 'Project was successfully destroyed'
  end
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :allowed_hours)
    end
end
