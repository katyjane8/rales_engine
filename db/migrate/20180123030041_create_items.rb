class CreateItems < ActiveRecord::Migration[5.1]
  def change

    create_table :items do |t|

      t.belongs_to :merchant,
        foreign_key: true

      t.text :name,               null: false
      t.text :description,        null: false
      t.integer :unit_price,      null: false
      t.timestamps                null: false

    end
  end
end
