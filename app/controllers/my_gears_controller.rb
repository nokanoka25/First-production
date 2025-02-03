class MyGearsController < ApplicationController
  before_action :set_group

  def index
    # 現在のグループでのユーザーのMyGearを表示
    @mygears = @group.my_gears.where(user: current_user).includes(:gear)

    mygear_gear_ids = @mygears.pluck(:gear_id) # すでにMygearに登録済みのGear ID
    @available_gears = current_user.gears.where.not(id: mygear_gear_ids) # 未登録のGear
  end


  def create
    gear = Gear.find(params[:gear_id])
    mygear = @group.my_gears.new(user: current_user, gear: gear)

    if @group.my_gears.exists?(user: current_user, gear: gear)
      flash[:alert] = "このギアはすでに追加されています"
    else
      mygear = @group.my_gears.new(user: current_user, gear: gear)
      
      if mygear.save
        flash[:notice] = "キャンプギアを追加しました"
        redirect_to group_path(@group)
      else
        flash[:alert] = "追加に失敗しました"
      end
    end
  end

  def destroy
    mygear = @group.my_gears.find_by(id: params[:id], user: current_user) # 修正: my_gears → mygears
    mygear.destroy
    flash[:notice] = "キャンプギアを削除しました"
    redirect_to group_path(@group)

  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def my_gear_params
    params.require(:my_gear).permit(:gear_id)
  end
end
