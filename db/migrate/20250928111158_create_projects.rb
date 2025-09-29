class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.uuid :uuid, default: -> { "gen_random_uuid()" }, null: false
      t.string :name, null: false
      t.text :description
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false

      t.datetime :deleted_at
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
