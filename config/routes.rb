Blox::Application.routes.draw do
  

  resources :bucket_blocs

  resources :profiles

  get "user/edit"
  get "user/update"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "my_devise/registrations" } #do
    #get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru' end

  resources :users 

  root to: "webpages#index"

  get "dashboard/show"

  post "crop_submit" => "blocs#crop_submit"

  get "about_us" => 'static#about_us'

  resources "contacts", only: [:new, :create]
  get "terms" => 'static#terms'

  resources :categories

  resources :webpages

  resources :blocs, :path => "blox"

  get "blocs/:id/preview", :controller => "blocs", :action => "preview"
  get "blox/:id/preview", :controller => "blocs", :action => "preview"

  resources :blocs do
    resources :likes
  end

  get 'tagged' => 'blocs#tagged', :as => 'tagged'

  resources :web_layouts do
    post :sort, on: :collection
  end

  

  # resources :dashboards

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
