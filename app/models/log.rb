class Log < ApplicationRecord

  belongs_to :device

  def self.purge_old_records
    self.where("created_at < ?", Date.today - 30.days).destroy_all
  end

end
