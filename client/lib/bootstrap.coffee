#declare namespaces
window.App ?= {}
window.Famous ?={}


Meteor.startup  ->

  Session.set 'currentTemplate','homeView'
  Session.set 'currentHeadFootTemplate','hfcontent'
  Session.set 'currentModHeadFootTemplate','hfcontent2'
  Session.set 'currentTransition', 'opacity'
  Session.set 'currentTransitionHead', 'slideWindow'
  Session.set 'transitionPages', false
  Session.set 'redboxclicked',false
  Session.set 'clicked',false
  Session.set 'mhfclicked',false
  Session.set 'menupressed',false
  Session.set 'serverURL', location.origin

  Logger.setLevel 'famous-views','info'
  App.ebtn = false
  App.hbtn = false
  App.angle = new Famous.Transitionable -Math.PI/3

  App.xpos = new Famous.Transitionable 0
  App.scale = new Famous.Transitionable 1
  App.isToggled = false
  App.events = new Famous.EventHandler
  App.EVENT_TYPE = unless window.ontouchstart is undefined then 'touchstart' else 'click'

App.getrotateY = ->
  return Session.get('rotate')

App.animateAndIncrement = (fview) ->
  fview.modifier.halt()
  fview.modifier.setTransform Famous.Transform.translate(0, 0),
    method: "spring"
    period: 200
    dampingRatio: .2
    velocity: 0.1
  Session.set "clickCount", Session.get("clickCount") + 1

App.menuanimate = (fview) ->

  fview.modifier.setTransform Famous.Transform.translate(-50,0),{duration: 500,ease: "easeInOut"},=>
    fview.modifier.setTransform Famous.Transform.translate(0,0),{duration: 500,ease: "easeInOut"}