class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices
  validates_presence_of :first_name, :last_name

  def favorite_merchant
    merchants.select("merchants.*, count(transactions) AS total").joins(invoices: [:transactions]).merge(Transaction.unscoped.success).group(:id).order("total DESC").first
  end
end
