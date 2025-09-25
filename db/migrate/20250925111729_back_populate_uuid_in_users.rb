class BackPopulateUuidInUsers < ActiveRecord::Migration[8.0]
  disable_ddl_transaction!  # For large datasets, prevents transaction locking

  def up
    execute <<-SQL.squish
      UPDATE users
      SET uuid = gen_random_uuid()
      WHERE uuid IS NULL;
    SQL
  end

  def down
    # no-op: can’t "un-generate" UUIDs
  end
end
