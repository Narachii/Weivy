$ ->
  $('#wei_button').on 'click', ->
    number = $(this).parent().parent().data("user-id")
    sender_class = ".sender_#{number}"
    receiver_class = ".receiver_#{number}"
    sender = $("#{sender_class}").val()
    receiver = $("#{receiver_class}").val()

    wei = { sender_id: sender, receiver_id: receiver}

    App.wei.speak(wei)

    return
