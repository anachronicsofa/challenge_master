class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.string :reference
      t.string :purchase_channel
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
