class WeiChannel < ApplicationCable::Channel
#  def subscribed
#     stream_from "wei_channel"
#  end

 # def unsubscribed
 #   # Any cleanup needed when channel is unsubscribed
 # end

#  def speak(data)
#    Wei.create!(receiver: data["wei"]["sender_id"], sender: data["wei"]["receiver_id"])
#    #ActionCable.server.broadcast 'wei_channel', user: data['user']
#  end
end
