class Customer < ApplicationRecord

  has_many :invoices

  validates_presence_of :first_name, :last_name

  def self.favorite_for_merchant(id)
    joins(
      invoices: :transactions
    ).where(
      invoices: { merchant_id: id },
      transactions: { result: :success }
    ).group(
      :id
    ).order(
      'count(transactions.id) DESC'
    ).first
  end

end
