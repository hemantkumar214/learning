class Members::RegistrationsController < Devise::RegistrationsController
before_filter :configure_devise_permitted_parameter
def new
    super
 end

def create
	build_resource(sign_up_params)
	resource_saved = resource.save
	yield resource if block_given?
	if resource_saved
		MemberMailer.welcome_email(params[:member])
	if resource.active_for_authentication?
	set_flash_message :notice, :signed_up if is_flashing_format?
	sign_up(resource_name, resource)
	respond_with resource, location: after_sign_up_path_for(resource)
	else
	set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
	expire_data_after_sign_in!
	respond_with resource, location: after_inactive_sign_up_path_for(resource)
	end
	else
	clean_up_passwords resource
	respond_with resource
end
	#render plain: params    
end

def update
	super
end

def configure_devise_permitted_parameter
	devise_parameter_sanitizer.for(:sign_up) do |u|
		u.permit(:email, :password, :password_confirmation, :username, :phone_no)
	end
	devise_parameter_sanitizer.for(:account_update) do |u|
		u.permit(:email, :password, :password_confirmation, :username, :phone_no)
	end
end

end