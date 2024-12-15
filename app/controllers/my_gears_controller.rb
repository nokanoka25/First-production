class MyGearsController < ApplicationController
  before_action :set_group

  def index
    # 現在のグループでのユーザーのMyGearを表示
    @my_gears = MyGear.where(user: current_user, group: @group)
    @available_gears = current_user.gears
  end


  def destroy
    # MyGear的に削除するが、users_gears自体は削除せずMyGear専用の一時的データから削除
    @my_gear = MyGear.find_by(user: current_user, gear_id: params[:id], group: @group)
    if @my_gear
      @my_gear.destroy
      redirect_to group_path(@group), notice: "持ち物を削除しました。"
    else
      redirect_to group_path(@group), alert: "削除対象のギアが見つかりません。"
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def my_gear_params
    params.require(:my_gear).permit(:gear_id)
  end
end
