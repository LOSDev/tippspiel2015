Rails.application.routes.draw do
  
  resources :tipp_groups do
    member do
     post 'create_member'
     delete 'delete_member'
    end
  end
  get 'rankings/overall/:id', to: 'rankings#overall', as: :rankings_overall_show
  
  get 'rankings/matchday/:id', to: 'rankings#matchday', as: :rankings_matchday_show

  get 'regeln', to: 'static_pages#rules', as: :rules
  get 'home', to: 'static_pages#home', as: :home

  get 'tipps', to: 'tipps#index', as: :tipps_index
  get 'tipps/:id', to:'tipps#edit', as: :edit_tipp
  post 'tipps', to:'tipps#create', as: :tipps
  #resources :tipps

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
