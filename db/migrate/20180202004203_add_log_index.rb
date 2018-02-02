class AddLogIndex < ActiveRecord::Migration[5.1]
  change_table :logs do |t|
    t.index :device_id
  end
end
