App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    window.scrollTo(0,document.body.scrollHeight);

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    user = $('#user').text()
    if user == 'Профиль пациента'
      client = 0
    else
      client = 1
    if (data.sender == 0 and client == 0) or (data.sender == 1 and client == 1)
      klass = 'self'
    else
      klass = 'other'
      Materialize.toast(data.sender_name+' прислал вам новое сообщение', 5000)
    chat = $('#chat').append('<li class="'+klass+'">
      <div class="avatar">
         <img src="'+data.avatar_url+'">
      </div>
      <div class="msg">
        <p>'+data.content+'</p>
        <time>'+data.time+'</time>
      </div>
    </li>')
    window.scrollTo(0,document.body.scrollHeight);
