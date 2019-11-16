import consumer from "./consumer"
let counter = 0


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
   
   

    $('#notifications').append(`<div class="alert alert-warning alert-dismissible fade show" role="alert" >
 You Have A Message From ${data.user}  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>`)
    
$(".alert").delay(4000).slideUp(200, function() {
    $(this).alert('close');
});

counter++
$('#notification_header').html(`Conversations <span class="badge badge-info"> Unread Messages</span>`)

document.cookie = `unread=${counter}`
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