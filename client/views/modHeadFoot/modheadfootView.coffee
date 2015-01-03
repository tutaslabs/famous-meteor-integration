

Template.modheadfootView.rendered = ->
#pull the view up then animate down when finished
#happens so fast appears to be animating down only

  App.hfl = new Famous.Transitionable 0
#so menu doesn't show on background when scrolling
  FView.byId('backing').modifier.setTransform Famous.Transform.translate(0, 0,-2)
  fview = FView.byId 'hfl'
  fhl = FView.byId('headl').surface
  fht = FView.byId('headt').surface
  fhr = FView.byId('headr').surface


  fview.modifier.transformFrom =>
    currentPosition = App.hfl.get()
    return Famous.Transform.translate(currentPosition,0, 0)
  sync = new Famous.GenericSync ['mouse','touch'],{direction: Famous.GenericSync.DIRECTION_X}
#  Famous.Engine.pipe sync
#  fhs.pipe sync
  fhl.pipe sync
  fht.pipe sync
  fhr.pipe sync

  fview = FView.byId 'b1'
  target = fview.surface
  target.on "click", =>
    Router.go '/'

  for i in [1..5]
    fview = FView.byId("m"+i)
    target = fview.surface
    target.on "click",(evt) =>
      flag = Session.get 'menupressed'
      if  flag is off
        flag = Session.set 'menupressed',true
        s = FView.byId(evt.currentTarget.classList[2])

        App.menuanimate(s)
        if evt.currentTarget.classList[2] is "m1"
          fhr.setContent 'Header'
          fhr.removeClass 'headArrows'
          App.hfl.set 0,{duration: 500,ease: "easeInOut"},=>
            Session.set 'currentModHeadFootTemplate','design'
          Meteor.setTimeout ->
            FView.byId('backing').modifier.setTransform Famous.Transform.translate(0, 0,-2)
          ,600

        else if evt.currentTarget.classList[2] is "m2"
          fhr.setContent 'Header'
          fhr.removeClass 'headArrows'
          App.hfl.set 0,{duration: 500,ease: "easeInOut"},=>
            Session.set 'currentModHeadFootTemplate','dribble'
          Meteor.setTimeout ->
            FView.byId('backing').modifier.setTransform Famous.Transform.translate(0, 0,-2)
          ,600

        Meteor.setTimeout ->
          Session.set 'menupressed',false
        ,500
  timerFired = (nm) ->
    s  = FView.byId("m"+nm)
    s.modifier.setTransform Famous.Transform.translate(0,0,-1),{duration: 200,ease: "easeInOut"}

  animate = ->
    for i in [1..5]
      s  = FView.byId("m"+i)
      s.modifier.setTransform Famous.Transform.translate(0,(6-i)*100,-1)
    for nm in [1..5]
      delay = nm*200
      Famous.Timer.setTimeout(timerFired.bind(this,nm),delay)

  sync.on 'end', =>
    flag = Session.get 'mhfclicked'
    if  flag is off
      Session.set 'mhfclicked',true
      if App.hfl.get() is 0
        App.hfl.set window.innerWidth - 100,{duration: 500,ease: "easeInOut"}
        FView.byId('backing').modifier.setTransform Famous.Transform.translate(0, 0,-10)
        fhr.setContent '<<'
        fhr.addClass 'headArrows'
        animate()
      else
        fhr.setContent 'Header'
        fhr.removeClass 'headArrows'
        App.hfl.set 0,{duration: 500,ease: "easeInOut"}
        Meteor.setTimeout ->
          FView.byId('backing').modifier.setTransform Famous.Transform.translate(0, 0,-2)
        ,600
      Meteor.setTimeout ->
        Session.set 'mhfclicked',false
      ,500



