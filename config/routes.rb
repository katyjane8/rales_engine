Rails.application.routes.draw do
  namespace :api, except: [:new, :edit] do
    namespace :v1 do

      resources :merchants do
        scope module: :merchants do
          resources :items, :invoices, only: :index
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
        end
      end

      %i{ merchants customers items invoices invoice_items transactions}.each do |model|
        namespace model do
          get :find, to: "search#show"
          get :find_all, to: "search#index"
          get :random, to: "random#show"
        end
      end
    end
  end
end
