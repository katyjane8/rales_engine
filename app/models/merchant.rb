class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates_presence_of :name

  def total_revenue
    invoices.joins(:invoice_items, :transactions).merge(Transaction.unscoped.success).sum("quantity * invoice_items.unit_price")
    # invoice_items.joins(invoice: :transactions).merge(Transaction.unscoped.success).sum("quantity * invoice_items.unit_price")
  end

  def self.total_items(x)
    select("merchants.*, sum(invoice_items.quantity) AS item_total").joins(invoices: [:transactions, :invoice_items]).merge(Transaction.unscoped.success).group(:id).order("item_total DESC").limit(x)
  end
end
