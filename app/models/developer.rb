class Developer < ActiveRecord::Base
  has_many :time_entries
  belongs_to :project
  validates :email, presence: true
  validates :email, uniqueness: true
end
