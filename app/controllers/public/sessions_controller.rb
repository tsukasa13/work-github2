# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_customer_session_path
  end
  
  private
  # アクティブであるかを判断するメゾット
  def customer_state
    # [処理内容1] 入力されたemailからアカウントを1件取得
    customer = Customer.find_by(email: params[:customer][:email])
    # [処理内容2] アカウントを取得できなかった場合、このメソッドを終了する
    return if customer.nil?
    # [処理内容3] 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
    return unless customer.valid_password?(params[:customer][:password])
    # [処理ないよう4] アクティブでない会員に対する処理
    if is_deleted == true
      flash[:notice] = "退会済みです。再度ご登録してご利用ください"
      redirect_to new_customer_registration_path
    else is_deleted == false
      flash[:notice] = "項目を入力してください"
    end
  end
end
