class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  validates_presence_of :name, :description, :unit_price

  def best_day
    invoice_items.joins(invoice: :transactions).merge(Transaction.unscoped.success).group(:id).order("invoice_items.quantity DESC").first.invoice.created_at
  end

  def self.most_items(x)
    select("items.*, sum(invoice_items.quantity) AS items_sold").joins(invoices: :transactions).merge(Transaction.unscoped.success).group(:id).order("items_sold DESC").limit(x)
  end
end
