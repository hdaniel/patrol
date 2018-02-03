class AddAlwaysAlertToDevices < ActiveRecord::Migration[5.1]
  def change
    add_column :devices, :always_alert, :boolean
  end
end
