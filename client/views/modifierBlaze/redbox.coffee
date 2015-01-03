Template.redbox.rendered = ->
  App.angled = new Famous.Transitionable -60
  defaultd = App.angled.get()
  degtorad = 0.0174533

  fview = FView.from(this)
  s = fview.surface


  fview.modifier.transformFrom =>
    return Famous.Transform.rotateY App.angled.get()*degtorad

##################### bug - getting double clicks for some reason - need to delay for 500ms
  s.on "click", =>
    flag = Session.get 'redboxclicked'
    if  flag is off

      Session.set 'redboxclicked',true
      if App.isToggled is on
        targetAngle = defaultd
      else
        targetAngle = -defaultd
      if (App.angled.isActive())
        App.angled.halt()

      App.angled.set targetAngle, { duration: 2000, curve: 'easeInOut' }
      App.isToggled = !App.isToggled

      Meteor.setTimeout ->
        Session.set 'redboxclicked',false
      ,500