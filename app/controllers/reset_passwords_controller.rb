class ResetPasswordsController < ApplicationController
   def new
    
   end
   

  def create 
    @user = User.find_by(email: params[:email])
    if @user.present?
      # send email to them
      PasswordMailer.with(user: @user).reset.deliver_now
      redirect_to root_path, notice: 'Please check your email for your password'
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: 'Your token has expired, please try again'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      redirect_to sign_in_path, notice: 'You was reset sucessfully, please sign in'
    else
      render 'edit'
    end
  end
  
  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
  
end