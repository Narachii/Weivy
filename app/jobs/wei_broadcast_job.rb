class WeiBroadcastJob < ApplicationJob
  queue_as :default

  def perform(*args)
     ActionCable.server.broadcast 'wei_channel', user: render_user(user)
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'users/user', locals: { user: user })
  end
end
