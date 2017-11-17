
topic = document.location.hash

App.url = App.cable.subscriptions.create {channel: "UrlChannel", topic: topic},
  connected: ->
    console.log("Connected")
    # Called when the subscription is ready for use on the server

  disconnected: ->
    console.log("Disconnected")
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    # Called when there's incoming data on the websocket for this channel
    Rails.$("#url_frame")[0].src = data['url']
