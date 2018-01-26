class ApplicationController < ActionController::API

  def render_id_and_errors(record)
    render json: {
      id: record.id,
      errors: record.errors
    }
  end

  def in_cents(dollars)
    (dollars.to_f * 100).round
  end

  def in_dollars(cents)
    '%.2f' % (cents / 100.0)
  end

end
