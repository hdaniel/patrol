class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :mac_address
      t.string :ip_address
      t.string :vendor
      t.string :hostname
      t.string :notes
      t.datetime :last_seen_at

      t.timestamps
    end
  end
end
