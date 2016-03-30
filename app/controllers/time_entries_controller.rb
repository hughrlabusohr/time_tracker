class TimeEntriesController < ApplicationController
  before_action :logged_in?
  
  def new
    @time_entry = TimeEntry.new
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)
    if @time_entry.save
      redirect_to time_entries_path, notice: 'Time Entry was successfully created.'
    else
      render :new
    end
  end

  def delete
    @time_entry.destroy
      redirect_to time_entries_url, notice: 'Time Entry was successfully destroyed.'
  end

  def index
    @time_entries = TimeEntry.all
  end

  def show
  end

  def update
    if @time_entry.update(time_entry_params)
      redirect_to time_entries_index_path, "Time Entry was successfully updated."
    else
      render :index
    end
  end

  private
    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    def time_entry_params
      params.require(:time_entry).permit(:duration, :date, :developer_id, :project_id)
    end
end
