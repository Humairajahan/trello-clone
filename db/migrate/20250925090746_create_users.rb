class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.uuid :uuid
      t.string :email
      t.string :password_digest
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
