class CreateBoards < ActiveRecord::Migration[8.0]
  def change
    create_table :boards do |t|
      t.uuid :uuid, default: -> { "gen_random_uuid()" }, null: false
      t.string :name
      t.references :project, null: false, foreign_key: true
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
