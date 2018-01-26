class ItemSerializer < ActiveModel::Serializer
  attributes :id, :merchant_id, :name, :description, :unit_price

  def unit_price
    '%.2f' % (object.unit_price / 100.0)
  end
end
