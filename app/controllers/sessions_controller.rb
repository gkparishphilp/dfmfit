class SessionsController < Devise::SessionsController


	def create
		self.resource = warden.authenticate!( auth_options )

		sign_in( resource_name, resource )
		flash[:success] = 'You are now logged in.'

		redirect_to after_sign_in_path_for( resource )
		#flash[:success] = 'You are now logged out.'
	end


end
