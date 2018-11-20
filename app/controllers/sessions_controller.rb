class SessionsController < Devise::SessionsController


	def create
		self.resource = warden.authenticate!( auth_options )

		sign_in( resource_name, resource )
		#flash[:primary] = 'You are now logged in.'

		redirect_to after_sign_in_path_for( resource )

	end


end
