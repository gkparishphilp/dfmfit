Rails.application.routes.draw do

	root to: 'root#index' # homepage

	resources :admin
	resources :events
	resources :workout
	resources :waivers do
		get :thank_you, on: :collection
	end
	resources :waiver_admin
	resources :logs
	resources :contacts do
		get :thank, on: :collection
	end
	resources :promo_admin
	resources :contact_admin 


	get 'pages/about'
	get 'pages/staff'
	get 'pages/membership'
	get 'pages/training'
	get 'pages/dropins'


	devise_scope :user do
		get 'users/sign_in' => 'sessions#new', as: 'sign_in'
		get '/logout' => 'sessions#destroy', as: 'logout'
		get '/users/sign_up' => 'registrations#new', as: 'new_user_registration'

	end

	devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }

	mount SwellId::Engine, at: '/'
	mount Pulitzer::Engine, at: '/'
	mount Scuttlebutt::Engine, at: '/'

	get '/wod', to: 'root#wod'

	# quick catch-all route for static pages set root route to field any media
	get '/:id', to: 'root#show', as: 'root_show'
end
