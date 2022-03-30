# frozen_string_literal: true

class Admin::SessionsController <  Devise::SessionsController

   before_action :configure_sign_in_params, only: [:create] #下のconfigure_sign_in_paramsに投げかけるため

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

  protected#下のdefをアクションと認識させない様にする記述

  #If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

   def after_sign_in_path_for(resouce)
     admin_homes_top_path
   end
end
