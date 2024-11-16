class UserSessionsController < ApplicationController
 
  
  def create
    @user = login(params[:email], params[:password],)

    if @user
      redirect_to user_path(id: current_user), notice: 'ログインに成功しました'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to tops_path, notice: 'ログアウトしました'
  end
end
