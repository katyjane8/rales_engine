class SearchController < ApplicationController

  def search_params
    ps = params
    [:created_at, :updated_at].each do |stamp|
      ps[stamp] = DateTime.parse(ps[stamp]) if ps[stamp].is_a? String
    end
    ps[:unit_price] = in_cents(ps[:unit_price]) if ps[:unit_price].is_a? String
    ps
  end

end
