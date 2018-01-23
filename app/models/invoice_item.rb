class InvoiceItem < ApplicationRecord

  belongs_to :invoice
  belongs_to :item

  validates_presence_of :quantity,
                        :unit_price,
                        :created_at,
                        :updated_at

  end
