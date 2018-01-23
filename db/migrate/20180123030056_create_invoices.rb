class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|

      t.belongs_to :customer,
        foreign_key: true

      t.belongs_to :merchant,
        foreign_key: true

      t.integer :status, null: false
      t.timestamps null: false

    end
  end
end
