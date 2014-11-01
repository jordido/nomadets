Rails.application.routes.draw do
   
  root 'users#index'
  
  get 'map' => 'users#map', as: :map

  get 'teachers' => 'users#teachers'
  put 'teachers/:id' => 'users#update', as: :teacher
  patch 'teachers/:id' => 'users#update'

  get 'students' => 'users#students'
  put 'students/:id' => 'users#update', as: :student
  patch 'students/:id' => 'users#update'
  
  get 'venues' => 'users#venues'
  put 'venues/:id' => 'users#update', as: :venue
  patch 'venues/:id' => 'users#update'

  get 'reviews_by/:id' =>'reviews#show_by', as: :reviews_by
  
  resources :reviews
  resources :users, only: [:create, :index, :show, :edit, :update, :new, :destroy]
  resources :categories, only: [:create, :index, :show, :edit, :update, :new, :destroy]

  get 'reviews_by/:id' =>'reviews#show_by'

  patch "/users", to: "users#update"

  post   "/login",  to: "login#create"
  delete "/logout", to: "login#destroy"

  #mount Upmin::Engine => '/admin'

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
