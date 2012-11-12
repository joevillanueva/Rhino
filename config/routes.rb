Rhino::Application.routes.draw do
  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  resources :users

  resource :session, :only => [:new, :create, :destroy]   # [22] this line creates 3 new routes (new, create, destroy) 
  # for a sessions controller that is created when you save this for the first time

  # [23] Now head to Terminal and run the 'rake routes' command to see all the paths, including our newly generated ones!
  # [24] After checking routes, lets generate a controller to manage the sessions.
  # [25] Lets run this command: rails generate controller Sessions new create destroy
  # [26] This command generates a new controller file called "sessions_controller.rb" with 3 methods (new, create, and destroy)
  # [27] Lets head to: your_app_name/app/controllers/newly_generated_controller (replace newly_generated_controller with sessions_controller.rb in this example)

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
