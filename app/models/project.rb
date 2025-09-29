class Project < ApplicationRecord
  belongs_to :organization

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
