class Batch < ApplicationRecord
    validates :reference, presence: true
    validates :purchase_channel, presence: true
    has_many :orders
  end
  