class Device < ApplicationRecord

  has_many :logs, dependent: :destroy

end
