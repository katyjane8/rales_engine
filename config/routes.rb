Rails.application.routes.draw do
  namespace :api, except: [:new, :edit], as: nil do
    namespace :v1, as: nil do

      %i{ merchants customers items invoices invoice_items transactions}.each do |model|
        namespace model do
          get :find, to: "search#show"
          get :find_all, to: "search#index"
          get :random, to: "random#show"
        end
      end

      namespace :merchants do
        get :most_items, to: 'most_items#index'
        get :most_revenue, to: 'most_revenue#index'
      end

      namespace :items do
        get :most_items, to: 'most_items#index'
        get :most_revenue, to: 'most_revenue#index'
      end

      resources :merchants do
        scope module: :merchants do
          resources :items, :invoices, only: :index
          get :revenue, to: 'revenue#show'
          get :customers_with_pending_invoices,
            to: 'customers_with_pending_invoices#index'
          get :favorite_customer, to: 'favorite_customer#show'

        end
      end

      resources :invoices do
        scope module: :invoices do
          resource :customer, :merchant, only: :show
          resources :transactions, :items, :invoice_items, only: :index
        end
      end

      resources :invoice_items do
        scope module: :invoice_items do
          resource :item, :invoice, only: :show
        end
      end

      resources :items do
        scope module: :items do
          resource :merchant, only: :show
          resources :invoice_items, only: :index
          get :best_day, to: 'best_day#show'
        end
      end

      resources :transactions do
        scope module: :transactions do
          resource :invoice, only: :show
        end
      end

      resources :customers do
        scope module: :customers do
          resources :invoices, :transactions, only: :index
          get :favorite_merchant, to: 'favorite_merchant#show'
        end
      end

    end
  end
end
