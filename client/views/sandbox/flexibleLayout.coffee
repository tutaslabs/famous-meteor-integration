Template.flexiblelayout.rendered = ->
# doesn't work on ios

  toggle = clicked = false
  s = FView.byId 'fl'
  s.view.setRatios [2,3,5]
  b = FView.byId 'b1'

  b.surface.on 'click',=>
    if clicked is off
      clicked = on
      if toggle is off
        s.view.setRatios [5,3,2]
      else
       s.view.setRatios [2,3,5]
      toggle = !toggle
      Meteor.setTimeout =>
        clicked = false
      ,100