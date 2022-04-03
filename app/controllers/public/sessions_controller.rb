# frozen_string_literal: true
class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  #これからログインしてくるユーザーが退会しているかを判断するメソッド
  def customer_state
    #[処理内容１]　入力されたemailからアカウントを１件取得
    @customer = Cusomer.find_by(email: params[:customer][:email])
    #アカウントを取得できなかった場合、このメソッドを修了する。
    return if !@customer#もしemailがなければ
    #[処理内容２]　取得したアカウントのパスワードと入力されたパスワードが一致しているかを判別
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_delated==true)
      #[処理内容]
        redirect_to public_homes_top_path

    end
  end
  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
   end

  def after_sign_out_path_for(resource)
    public_homes_top_path#サインアウト後の遷移先のパス
  end

  def after_sign_in_path_for(resource)
    public_homes_top_path#サインアウト後の遷移先のパス
  end
end