class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :reference
      t.string :client_name
      t.string :purchase_channel
      t.string :address
      t.string :delivery_service
      t.string :total_value
      t.string :line_items
      t.string :status
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end
