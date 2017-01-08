Rails.application.routes.draw do
  #resources :reviews, except: [:show, :index]
  #automatically creates URL's for our various pages.  We need to place our restaurant ID
  # in our URL, and to do that we'll nest our reviews resource Inside our restaurant Resource.


  devise_for :users
  resources :restaurants do # "resources :restaurants" is the code that creates our various restaurant related URL's...To add a new one we need to go to the next line...
    #begin searchkick installation
    collection do
      get 'search'
    end
    #End of searchkick installation
    # This just creates a new URL at localhost:3000/restaurants/search
    # The word "collection" here just means search will apply to more than one restaurant.
    # If we were only applying search to 1 restaurant, then we would use the word 'member'

    resources :reviews, except: [:show, :index]
  end



  get 'pages/about'

  get 'pages/contact'

  root 'restaurants#index'

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
