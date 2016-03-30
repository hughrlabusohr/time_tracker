class DevelopersController < ApplicationController
  before_action :logged_in?
  def index
    @developers = Developer.all
  end

  def create
    @developer = Developer.new(developer_params)

    if @developer.save
      redirect_to @developer, notice: 'Developer was succesfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @developer.destroy
      redirect_to developers_url, notice: 'Developer was successfully destroyed'
  end


  def show
  end

  def update
    if @developer.update(developer_params)
      redirect_to @developer, notice: 'Developer was successfully updated.'
    else
      render :edit
    end
  end

  def new
    @developer = Developer.new
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_developer
    @developer = Developer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def developer_params
    params.require(:developer).permit(:id, :name, :email, :password, :password_digest)
  end
end
