class Developer < ActiveRecord::Base
  has_secure_password
  has_many :time_entries
  belongs_to :project
  validates :email, presence: true
  validates :email, uniqueness: true
end
