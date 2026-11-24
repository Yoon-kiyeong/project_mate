class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # 新規登録の時、nickname フィールド許容
    devise_parameter_sanitizer.permit(:sign_up, keys: [:id, :nickname, :github_url, :portfolio_url])

    # 会員情報変更の時のも必要であれば、追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :github_url, :portfolio_url])
  end
end
