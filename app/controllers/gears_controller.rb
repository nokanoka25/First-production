class GearsController < ApplicationController
  def index
  end

  def new
    @gear = Gear.new
  end

  def create
    # ギアを新規作成
    @gear = Gear.find_or_create_by(gear_params)
    # 中間テーブルにデータを保存
    UsersGear.create(user: current_user, gear: @gear)

    redirect_to user_path(current_user), notice: 'キャンプギアを登録しました。'
  end
  
  def edit
    @gear = Gear.find(params[:id])
  end

  def update
    @gear = Gear.find(params[:id])
    if @gear.update(gear_params)
      redirect_to user_path(current_user), notice: 'キャンプギアを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    gear = Gear.find(params[:id])
    gear.destroy!
    redirect_to user_path(current_user), notice: 'キャンプギアを削除しました。'
  end

  private

  def gear_params
    params.require(:gear).permit(:gear_type, :name, :length, :width)
  end
end
