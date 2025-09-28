class CreateOrganizations < ActiveRecord::Migration[8.0]
  def change
    create_table :organizations do |t|
      t.uuid :uuid, default: -> { "gen_random_uuid()" }, null: false
      t.string :name, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
