class Project < ActiveRecord::Base
  has_many :time_entries
  has_many :developers, through: :time_entries

  def hours_worked
    time_entries.sum(:duration)
  end
  def overtime
    hours_worked > allowed_hours
  end
end
