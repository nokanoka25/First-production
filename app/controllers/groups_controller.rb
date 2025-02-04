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
      UsersGroup.create!(user: current_user, group: @group)
      redirect_to user_path(current_user), notice: "グループを作成しました。"
    else
      Rails.logger.info(@group.errors.full_messages)
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @information = @group.information
    @messages = @group.messages
    @post = @group.posts
    @top_voted_post = @group.top_voted_post
    @schedules = @group.schedules.order(scheduled_at: :asc) # 日時順に並べる
    @mygears = @group.my_gears.where(user: current_user).includes(:gear)
    mygear_gear_ids = @mygears.pluck(:gear_id) # すでにMygearに登録済みのGear ID
    @available_gears = current_user.gears.where.not(id: mygear_gear_ids) # 未登録のGear

    # グループ全体の MyGear を取得
    @group_my_gears = MyGear.includes(:gear, :user).where(group: @group)

    # その他データ取得
    @all_gears = @group.my_gears.includes(:gear, :user)

    @total_area = Gear.joins(users: :users_groups)
                      .where(users_groups: { group_id: @group.id }, gear_type: [ "タープ", "テント" ])
                      .sum("gears.length * gears.width")
    @posts = @group.posts.includes(:votes)  # 投稿一覧を取得（N+1対策）

                      # ① 投票数が最も多い投稿の投票数を取得
    top_vote_count = @posts.left_joins(:votes)
                     .group(:id)
                     .order('COUNT(votes.id) DESC')
                     .limit(1)
                     .pluck('COUNT(votes.id)')
                     .first || 0  # 投票がない場合は0を設定
                
                      # ② 同じ投票数を持つ投稿をすべて取得
    @top_voted_posts = @posts.left_joins(:votes)
                       .group(:id)
                       .having('COUNT(votes.id) = ?', top_vote_count)
                       .order('camp_site_name ASC') # 名前順にソート
  end

  def set_voting_period
    @group = Group.find(params[:id])
  end

  def update_voting_period
    @group = Group.find(params[:id])
    if @group.update(voting_period_params)
      # ジョブをスケジュール
      @group.schedule_voting_result_job
      redirect_to @group, notice: "投票期間を設定しました。"
    else
      render :set_voting_period
    end
  end

  def initialize_my_gears
    @group = Group.find(params[:id])

    current_user.gears.each do |gear|
      MyGear.find_or_create_by(user: current_user, gear: gear, group: @group)
    end

    redirect_to group_path(@group), notice: "MyGearを初期化しました。"
  end

  def join_with_token
    @group = Group.find_by(token: params[:token])

    if @group.nil?
      redirect_to groups_path, alert: "無効なトークンです。"
    elsif @group.users.include?(current_user)
      redirect_to group_path(@group), notice: "既にこのグループに参加しています。"
    else
      @group.users << current_user
      redirect_to group_path(@group), notice: "グループに参加しました！"
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
