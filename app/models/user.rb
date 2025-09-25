class User < ApplicationRecord
  enum :role, [ :admin, :team_lead, :project_manager, :member ]

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
end
