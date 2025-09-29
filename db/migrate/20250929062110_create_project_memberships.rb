class CreateProjectMemberships < ActiveRecord::Migration[8.0]
  def change
    create_table :project_memberships, primary_key: [ :project_id, :user_id ] do |t|
      t.uuid :uuid, default: -> { "gen_random_uuid()" }, null: false
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
