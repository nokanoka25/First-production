class PostsController < ApplicationController
  before_action :set_group
    def index
      @post = Post.find(params[:id])
      @group = Group.find(params[:group_id]) # グループIDで取得
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

    def new
        @post = Post.new
    end

    def create
      @post = @group.posts.new(post_params) # set_group を利用して @group を使う
      if @post.save
        redirect_to @group, notice: "候補を投稿しました"
      else
        Rails.logger.error(@post.errors.full_messages)
        render "new"
      end
    end



    private

    def post_params
      params.require(:post).permit(:camp_site_name, :camp_site_address, :camp_site_url, :text, :group_id)
    end

    def set_group
      @group = Group.find(params[:group_id])
    end
end
