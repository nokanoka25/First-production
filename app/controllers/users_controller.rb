class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :show ]


  def show
    @gears = current_user.gears
    @groups = current_user.groups
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(:tops, notice: "ユーザー登録完了")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to(:user, notice: "変更しました")
    else
      render "edit"
    end
  end

  def edit; end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
