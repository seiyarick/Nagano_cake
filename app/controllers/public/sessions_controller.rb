# frozen_string_literal: true
class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
    before_action :customer_state, only: [:create]#一番初めに行う
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
    #[処理内容１]　入力されたemailからアカウントを１件取得、データがあるかないか確認、なければそのままcreateを続ける
    @customer = Customer.find_by(email: params[:customer][:email])
    #アカウントを取得できなかった場合、このメソッドを修了する。
    return if !@customer#もし@customerにemailがなければ
    #[処理内容２]　取得したアカウントのパスワードと入力されたパスワードが一致しているか、かつ、is_deleted==true(退会している状態)ならば
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted==true)
      #[処理内容]新規登録画面に遷移。is_deletedがfalse(退会していない)ならばそのままsession/createを続行
        redirect_to new_customer_registration_path

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