class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'group_channel', message: render_message(message)
  end

  # app/views/message/_message.html.erbを呼び出す。
  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'groups/message', locals: { message: message })
  end
end
