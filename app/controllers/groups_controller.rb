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
    @information = @group.information
    @messages = @group.messages
    @post = @group.posts
    @top_voted_post = @group.top_voted_post
    
  end

  def set_voting_period
    @group = Group.find(params[:id])
  end

  def update_voting_period
    @group = Group.find(params[:id])
    if @group.update(voting_period_params)
      # ジョブをスケジュール
      @group.schedule_voting_result_job
      redirect_to @group, notice: '投票期間を設定しました。'
    else
      render :set_voting_period
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def information_params
    params.require(:information).permit(:start_day, :finish_day, :camp_site_name, :camp_site_address, :camp_site_url, :car, :start_point, :check_in, :check_out, :group_id)
  end

  def post_params
    params.require(:post).permit(:camp_site_name, :camp_site_address, :camp_site_url, :text, :group_id)
  end

  def voting_period_params
    params.require(:group).permit(:voting_start_at, :voting_end_at)
  end
end
