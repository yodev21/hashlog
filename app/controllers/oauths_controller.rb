class OauthsController < ApplicationController
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if auth_params[:denied].present?
      redirect_to root_path, notice: 'ログインをキャンセルしました'
      return
    end
    if (@user = login_from(provider))
      redirect_to root_path, notice: "#{provider.titleize}でログインしました"
    else
      create_user_from(provider)
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :denied)
  end

  def create_user_from(provider)
    @user = create_from(provider)
    reset_session
    auto_login(@user)
    redirect_to root_path, notice: "#{provider.titleize}でログインしました"
  rescue StandardError
    redirect_to root_path, alert: "#{provider.titleize}でのログインに失敗しました"
  end
end