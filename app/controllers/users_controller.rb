class UsersController < ApplicationController
 
  def show
    user = User.find(params[:id])
    @name = user.name
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(:tops, notice: 'User was successfully created')
    else
      render 'new'
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
