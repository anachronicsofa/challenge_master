Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :orders do
        collection do
          get :show_status_by_name
          get :show_closing_order_by_purchase_ch
        end
      end
      resources :batches do
        member do
          post :printing_done
          post :deliver_order
          post :create
        end
      end
    end
  end
end
