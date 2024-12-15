class VotesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @vote = @post.votes.build(user: current_user)

    if @vote.save
      redirect_to group_posts_path(@post.group), notice: "投票しました！"
    else
      redirect_to group_posts_path(@post.group), alert: "既に投票済みです。"
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    if @vote.user == current_user
      @vote.destroy
      redirect_to group_posts_path(@vote.post.group), notice: "投票を取り消しました。"
    else
      redirect_to group_posts_path(@vote.post.group), alert: "操作が許可されていません。"
    end
  end
end
