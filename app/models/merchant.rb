class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates_presence_of :name

  def self.most_revenue(top_x)
    select('
      merchants.*,
      sum(invoice_items.quantity * invoice_items.unit_price) AS revenue
    ')
      .joins(invoices: [:transactions, :invoice_items])
      .where('transactions.result': :success)
      .group(:id)
      .order('sum(invoice_items.quantity * invoice_items.unit_price) DESC')
      .limit(top_x)
  end

end
