class GearsController < ApplicationController
  def index
  end

  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new(gear_params)
    if @gear.save
      redirect_to user_path(current_user), notice: 'キャンプギアを登録しました。'
    else
      render :new
    end
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
