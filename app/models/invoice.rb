class Invoice < ApplicationRecord

  belongs_to :customer
  belongs_to :merchant

  has_many :invoice_items
  has_many :transactions

  validates_presence_of :status

  def self.total_revenue
    joins(
      :invoice_items, :transactions
    ).where(
      'transactions.result': :success
    ).sum(
      'invoice_items.quantity * invoice_items.unit_price'
    )
  end

end
