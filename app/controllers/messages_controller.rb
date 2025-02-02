class MessagesController < ApplicationController
    before_action :set_group

  def create
    # 親オブジェクトに紐づけて作成
    @message = @group.messages.build(message_params)
    @message.user = current_user

    if @message.save
      redirect_to group_path(@group), notice: "メッセージを投稿しました"
    else
      Rails.logger.error(@message.errors.full_messages)
      flash[:alert] = "メッセージを入力してください"
      redirect_to group_path(@group)
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
