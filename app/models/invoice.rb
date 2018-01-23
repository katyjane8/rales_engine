class Invoice < ApplicationRecord

  belongs_to :customer
  belongs_to :merchant

  has_many :invoice_items
  has_many :transactions

  validates_presence_of :status,
                        :created_at,
                        :updated_at

end