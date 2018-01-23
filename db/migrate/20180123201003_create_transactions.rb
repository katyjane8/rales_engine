class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|

      t.belongs_to :invoice, foreign_key: true

      t.datetime :credit_card_expiration_date
      t.string :credit_card_number, null: false
      t.string :result, null: false
      t.timestamps null: false
    end
  end
end
