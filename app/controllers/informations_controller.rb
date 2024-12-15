class InformationsController < ApplicationController
  def index
    @information = Information.find(params[:id])
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    @information.group_id = params[:group_id]
    if @information.save
      redirect_to group_path(@information.group_id), notice: "グループを作成しました。"
    else
      render "new"
    end
  end

  def edit
    @information = Information.find_by!(id: params[:id], group_id: params[:group_id])
  end

  def update
    @information = Information.find(params[:id])
    if @information.update(information_params)
      redirect_to group_path(@information.group_id), notice: "情報を更新しました。"
    else
      render "edit"
    end
  end

  private


  def information_params
    params.require(:information).permit(:start_day, :finish_day, :camp_site_name, :camp_site_address, :camp_site_url, :car, :start_point, :check_in, :check_out, :group_id)
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
