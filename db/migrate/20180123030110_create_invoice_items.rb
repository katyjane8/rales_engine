class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|

      t.belongs_to :invoice, foreign_key: true
      t.belongs_to :item, foreign_key: true

      t.integer :quantity,      null: false
      t.integer :unit_price,    null: false
      t.timestamps              null: false

    end
  end
end
