Rails.application.routes.draw do

  get 'assigns/new'

  get 'assigns/destroy'

  get 'static_pages/home'
  get 'static_pages/help'
  root 'posts#index'

  get 'home' => "static_pages#home"
  get 'about' => "static_pages#about"

  resources :posts do
    get :autocomplete_company_name, :on => :collection
end


  resources :users
  resources :companies
  resources :categories
  resources :posts
  resources :products  
  resources :jobs
  resources :creators
  resources :pictures, only: [:new, :create, :destroy, :edit]
  resources :assigns, only: [:new, :create, :destroy, :edit]

  resources :posts do
    member do
      get 'addpicture'
    end
  end

  resources :posts do
    member do
      get 'addcreator'
    end
  end

  
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'


resources :posts do
    resources :pictures
  end

resources :companies do
  resources :products do
  end
end


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
