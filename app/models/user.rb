class User < ApplicationRecord
  enum :role, [ :admin, :team_lead, :project_manager, :member ]

  has_many :memberships
  has_many :organizations, through: :memberships

  has_many :project_memberships
  has_many :projects, through: :project_memberships

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
end
