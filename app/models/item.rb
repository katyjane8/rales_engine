class Item < ApplicationRecord

  belongs_to :merchant

  has_many :invoice_items

  validates_presence_of :name, :description, :unit_price

  def self.most_revenue(top_x)
    select('items.*,
      sum(invoice_items.quantity * invoice_items.unit_price) AS revenue')
    .joins(invoice_items: { invoice: :transactions })
    .where('transactions.result': :success)
    .group(:id)
    .order('sum(invoice_items.quantity * invoice_items.unit_price) DESC')
    .limit(top_x)
  end

end
