class Order < ApplicationRecord
  validates :reference, presence: true
  validates :client_name, presence: true
  validates :purchase_channel, presence: true
  validates :delivery_service, presence: true
  validates :status, presence: true
  belongs_to :batch
end
