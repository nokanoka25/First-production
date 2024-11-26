class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to user_path(current_user), notice: 'グループを作成しました。'
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
