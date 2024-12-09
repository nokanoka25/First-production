class VotesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        if current_user.votes.where(post: @post).exists?
          redirect_to group_path(current_user.group), alert: "すでに投票しています。"
        else
          current_user.votes.create!(post: @post)
          redirect_to group_path(current_user.group), notice: "投票しました！"
        end
      end
end
