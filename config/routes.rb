Qrreader::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  root to: "home#index"

  get 'sign_up' => 'member/users#new'
  post 'sign_in' => 'sessions#sign_in'
  get 'sign_out' => 'sessions#sign_out'
  

  #member in herit from application
  #create separate dashboard
  namespace :member do
    resource :user
    root to: "dashboard#index"
    resource :company do
      resources :departments
    end
    resources :employees
  end  

  namespace :admin do
    root to: "dashboard#index"
    resources :users, shallow: true do
      get 'home' => "users#home"
      resources :companies do
        resources :departments
        resources :employees
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users
      resources :companies
      resources :departments
      resources :employees
    end
  end

  get '/:eid' => 'home#employee'
  

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
