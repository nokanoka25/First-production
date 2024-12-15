class PostsController < ApplicationController
    def index
      @post = Post.find(params[:id])
      @group = Group.find(params[:group_id]) # グループIDで取得
      @posts = @group.posts # グループに紐づく投稿を取得
    end

    def new
        @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      @post.group_id = params[:group_id]
      if @post.save
        redirect_to group_path(@post.group_id), notice: "グループを作成しました。"
      else
        Rails.logger.error(@post.errors.full_messages)
        render "new"
      end
    end



    private

    def post_params
      params.require(:post).permit(:camp_site_name, :camp_site_address, :camp_site_url, :text, :group_id)
    end
end
