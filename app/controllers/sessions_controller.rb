class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_tp root_path
    else
      flash[:danger] = "メールまたはパスワードが正しくありません"
      render 'new'
    end
  end
end
