Rails.application.routes.draw do

	root to: 'root#index' # homepage

	resources :admin
	resources :events
	resources :workout
	resources :dropins
	resources :waivers do
		get :thank_you, on: :collection
	end
	resources :waiver_admin
	resources :logs
	resources :contacts 


	devise_scope :user do
		get 'users/sign_in' => 'sessions#new', as: 'sign_in'
		get '/logout' => 'sessions#destroy', as: 'logout'
		get '/users/sign_up' => 'registrations#new', as: 'new_user_registration'

	end

	devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }

	mount SwellId::Engine, at: '/'
	mount Pulitzer::Engine, at: '/'
	mount Scuttlebutt::Engine, at: '/'

	# quick catch-all route for static pages set root route to field any media
	get '/:id', to: 'root#show', as: 'root_show'
end
