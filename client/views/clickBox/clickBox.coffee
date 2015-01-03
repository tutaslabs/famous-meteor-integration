Template.clickBox.helpers
  'clickCount':  ->
    Session.get 'clickCount'

Template.clickBox.rendered = ->
  Session.set 'clickCount',50
  fview = FView.byId 's1'
  target = fview.surface
  clicked = off
  target.on "click", =>
    if clicked is off
      clicked = on
      App.animateAndIncrement(fview)
      Meteor.setTimeout =>
        clicked = off
      ,100

  fview2 = FView.byId 'b1'
  target2 = fview2.surface
  target2.on "click", =>
    Router.go '/'


