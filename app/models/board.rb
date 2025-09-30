class Board < ApplicationRecord
  enum :status, [ :to_do, :in_progress, :done ]
  belongs_to :project
end
