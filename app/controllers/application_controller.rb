class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    root_path
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
