class Project < ApplicationRecord
  belongs_to :organization

  has_many :project_memberships
  has_many :users, through: :project_memberships

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
