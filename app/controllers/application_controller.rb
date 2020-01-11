class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_up_path_for(resource)
		"/users/#{current_user.id}"#ログイン後に移動するpath
		# flash[:signedup] ="Welcome! You have signed up successfully."
	end

	def after_sign_in_path_for(resource)
		"/users/#{current_user.id}"#ログイン後に移動するpath
		# flash[:signedin] ="Signed in successfully."
	end



	protected
	def configure_permitted_parameters
		#devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
	end
end
