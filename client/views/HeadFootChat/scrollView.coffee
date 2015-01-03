Template.scrollView.items = ->
  query = Chat.find {}

Template.scrollView.rendered = ->
  Meteor.subscribe 'chat'



  ###
  @contents.on 'deploy', =>
    h = $('.famous-container .container')[0].scrollHeight
    @contents.setSize [undefined, h]
  ###