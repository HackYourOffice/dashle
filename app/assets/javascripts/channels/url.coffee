
topic = document.location.hash

nextIframe = 0;

App.url = App.cable.subscriptions.create {channel: "UrlChannel", topic: topic},
  connected: ->
    console.log("Connected to Topic: " + topic)
    # Called when the subscription is ready for use on the server

  disconnected: ->
    console.log("Disconnected")
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    # Called when there's incoming data on the websocket for this channel
    loadNextIfram(data['url'])

loadNextIfram = (url) ->
  currentIndex = nextIframe
  nextIframe++
  if nextIframe > 1
    nextIframe = 0
  $("#url_frame_" + currentIndex).attr('src', url)
  $("#url_frame_" + currentIndex).on("load", () ->
    $("#url_frame_" + currentIndex).show();
    $("#url_frame_" + nextIframe).hide();
  )
