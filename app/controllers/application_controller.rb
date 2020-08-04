class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def after_sign_in_path_for(resource)
      user_path(resource.id)  # Log_in後に遷移するpath
    end

    def after_sign_up_path_for(resource)
      user_path(resource.id)  # Sign_Up後に遷移するpath
    end

    def after_sign_out_path_for(resource)
      root_path  #ログアウト後に遷移するpath
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end

end
