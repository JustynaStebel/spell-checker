class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private
  def after_sign_in_path_for(resource_or_scope)
    if current_user.admin == true
      admin_users_path
    else
      documents_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
