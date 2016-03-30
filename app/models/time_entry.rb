class TimeEntry < ActiveRecord::Base
  belongs_to :developer
  belongs_to :project
  validates :duration, presence: true
  validates :developer_id, presence: true
  validates :project_id, presence: true

  def work_week
    time_entries.where(date:
      (beginning_of_week..end_of_week)
    ).sum(:duration)
  end
  def overtime
    work_week > 40
  end

end
