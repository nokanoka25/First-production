class UserSessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password], params[:remember_me])

    if @user
      # クッキーに user_id を保存
      cookies.encrypted[:user_id] = { value: current_user.id, expires: 1.hour.from_now }
      redirect_to user_path(id: current_user), notice: "ログインに成功しました"
    else
      flash.now[:alert] = "ログインに失敗しました"
      render action: "new"
    end
  end

  def destroy
    # ログアウト時にクッキーを削除
    cookies.delete(:user_id)
    logout
    redirect_to tops_path, notice: "ログアウトしました"
  end
end
