Rails.application.routes.draw do
	root to: 'root#index' # homepage

	resources :admin
	resources :schedule
	resources :workout
	resources :dropins
	resources :memberships

	get '/staff', to: 'root#staff'

	devise_scope :user do
		get '/login' => 'sessions#new', as: 'login'
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
