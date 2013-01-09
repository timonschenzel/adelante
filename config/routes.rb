Adelante::Application.routes.draw do
  root to: 'home#home'

  match '/therapies/autocomplete', to: 'therapies#autocomplete', via: :get
  match '/search/suggestions', to: 'search#suggestions', via: :get

  resources :clientsessions, only: [:new, :create, :destroy]
  resources :therapists
  resources :therapies
  resources :exercises
  resources :agenda
  resources :clients
  resources :colleagues

  match '/saved_therapies/create/(:id)', to: 'saved_therapies#create', via: :get, as: :create_saved_therapies
  match '/saved_therapies/delete/(:id)', to: 'saved_therapies#delete', via: :get, as: :delete_saved_therapies

  match '/home',  to: 'home#home'
  #match '/clients',  to: 'client#index'
  #match '/client/:id',  to: 'client#show'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/client/ajax_show/(:id)', to: 'client#ajax_show', via: :get

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
