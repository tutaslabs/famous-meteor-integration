Template.scrollView.items = ->
  query = Chat.find {}

Template.scrollView.rendered = ->
  Meteor.subscribe 'chat'

