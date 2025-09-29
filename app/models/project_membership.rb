class ProjectMembership < ApplicationRecord
  belongs_to :project
  belongs_to :user
  enum :role, [ :team_lead, :project_manager, :member ]
end
