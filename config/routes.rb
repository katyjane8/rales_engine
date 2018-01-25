require_relative 'routes_dsl_expansion'

Rails.application.routes.draw do
  singleton_class.include(RoutesDslExpansion)
  namespace :api do
    namespace :v1 do

      collection_of :merchants do
        indexes :most_items, :most_revenue
        shows :revenue
      end

      record_of :merchant do
        has_many :items, :invoices
        indexes :customers_with_pending_invoices
        shows :favorite_customer, :revenue
      end

      collection_of :items do
        indexes :most_items, :most_revenue
      end

      record_of :items do
        belongs_to :merchant
        has_many :invoice_items
        shows :best_day
      end

      record_of :invoices do
        belongs_to :customer, :merchant
        has_many :transactions, :items, :invoice_items
      end

      record_of :invoice_item do
        belongs_to :item, :invoice
      end

      record_of :transaction do
        belongs_to :invoice
      end

      record_of :customer do
        has_many :invoices, :transactions
        shows :favorite_merchant
      end

      %i{
        merchant
        customer
        invoice
        item
        invoice_item
        transaction
      }.each do |model|
        record_of model do
          get :find, to: "search#show"
          get :find_all, to: "search#index"
          shows :random
        end

        # keep this at the end
        resources model, only: [:show, :index]
      end

    end
  end
end
