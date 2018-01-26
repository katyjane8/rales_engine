class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices
  validates_presence_of :first_name, :last_name

  def favorite_merchant
    merchants.select("merchants.*, count(transactions) AS total").joins(invoices: [:transactions]).merge(Transaction.unscoped.success).group(:id).order("total DESC").first
  end

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

  def self.with_pending_invoices_for_merchant(id)
    find_by_sql "
      SELECT
        customers.*,
        count(invoices) as ordered,
        count(success) as paid
      FROM
        customers
      INNER JOIN
        invoices
        ON
        invoices.customer_id = customers.id
        AND
        invoices.merchant_id = #{id}
      LEFT OUTER JOIN
        transactions success
        ON
        success.invoice_id = invoices.id
        AND
        success.result = 'success'
      LEFT OUTER JOIN
        transactions failed
        ON
        failed.invoice_id = invoices.id
        AND
        failed.result = 'failed'
      GROUP BY
        customers.id
      HAVING
        count(invoices) > count(success)
        AND
        count(failed) > 0
      ;
    "
  end

end
