class TimeEntriesController < ApplicationController
  def index
    @time_entry = TimeEntry.all
  end
  def show
  end
  def new
    @time_entry = TimeEntry.new
  end
  def edit
  end
  def create
    @time_entry = TimeEntry.new(time_entry_params)

    if @time_entry.save
      redirect_to @time_entry, notice: 'Time Entry was succesfully created.'
    else
      render :new
    end
  end
  def update
    if @time_entry.update(time_entry_params)
      redirect_to @time_entry, notice: 'Time Entry was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @time_entry.destroy
      redirect_to time_entries_url, notice: 'Time Entry was successfully destroyed'
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_entry_params
      params.require(:time_entry).permit(:project_id, :developer_id, :date, :duration)
    end
end
