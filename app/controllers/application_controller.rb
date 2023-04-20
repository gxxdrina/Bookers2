class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  #サインイン後はUser showへ
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  
  #サインアウト後はrootへ
  def after_sign_out_path_for(resource)
    root_path
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
    
end
