import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the room!")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    $('#msg').append('<div class="text-left p-1 rounded mt-4"> '+ '<span style="background-color: #FFFFFF" class="p-3 rounded mt-2">' + '<strong>' + data.user+ '</strong>' + ": " + data.content + '</span>'+ '</div>')
   
  }
});

let submit_messages;

$(document).on('turbolinks:load', function () {
  $('#message_content').focus()
  submit_messages()
})

submit_messages = function () {
  $('#message_content').on('keydown', function (event) {
    if (event.keyCode == 13) {
      $('input').click()
      event.target.value = ''
      event.preventDefault()
    }
  })
}