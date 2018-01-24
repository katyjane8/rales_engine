class ApplicationController < ActionController::API

  def render_id_and_errors(record)
    render json: {
      id: record.id,
      errors: record.errors
    }
  end

end
