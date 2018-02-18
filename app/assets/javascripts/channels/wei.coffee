App.wei = App.cable.subscriptions.create "WeiChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    alert data['user']
    # Called when there's incoming data on the websocket for this channel

  speak: (wei)->
    @perform 'speak', wei: wei
