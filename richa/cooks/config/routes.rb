Rails.application.routes.draw do

  # Recipe Routes------------------------------------
  get 'recipes', to: 'recipes#index', as: :recipes

  get 'recipe/new', to: 'recipes#new', as: :new_recipe

  post 'recipes', to: 'recipes#create'

  get 'recipe/:id', to: 'recipes#show', as: :recipe

  get 'recipe/:id/edit', to: 'recipes#edit', as: :edit_recipe

  patch 'recipe/:id', to: 'recipes#update'

  delete 'recipe/:id', to: 'recipe#destroy'

  # RecipeIngredient Routes---------------------------
  get 'recipeingredients', to: 'recipeingredients#index', as: :recipeingredients

  get 'recipeingredient/new', to: 'recipeingredients#new', as: :new_recipeingredient

  post 'recipeingredients', to: 'recipeingredients#create'

  get 'recipeingredient/:id', to: 'recipeingredients#show', as: :recipeingredient

  get 'recipeingredient/:id/edit', to: 'recipeingredients#edit', as: :edit_recipeingredient

  patch 'recipeingredient/:id', to: 'recipeingredients#update'

  delete 'recipeingredient/:id', to: 'recipeingredients#destroy'

  # Ingredient Routes------------------------------------
  get 'ingredients', to: 'ingredients#index', as: :ingredients

  get 'ingredient/new', to: 'ingredients#new', as: :new_ingredient

  post 'ingredients', to: 'ingredients#create'

  get 'ingredient/:id', to: 'ingredients#show', as: :ingredient

  get 'ingredient/:id/edit', to: 'ingredients#edit', as: :edit_ingredient

  patch 'ingredient/:id', to: 'ingredients#update'

  delete 'ingredient/:id', to: 'ingredients#destroy'


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
