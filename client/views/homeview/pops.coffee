Template.pop1.rendered = ->

#this is sloppy as hell - couldn't get a for loop to work to create these
  fview = FView.byId 'pb1'
  target = fview.surface
  target.on "click", =>
    FView.byId('vpop1').modifier.setOpacity 0,{duration: 600,ease: "easeInOut"},=>
      FView.byId('pop1').surface.addClass 'hide'
      FView.byId('pb1').surface.addClass 'hide'

Template.pop2.rendered = ->
  fview = FView.byId 'pb2'
  target = fview.surface
  target.on "click", =>
    FView.byId('vpop2').modifier.setOpacity 0,{duration: 600,ease: "easeInOut"},=>
      FView.byId('pop2').surface.addClass 'hide'
      FView.byId('pb2').surface.addClass 'hide'
Template.pop3.rendered = ->
  fview = FView.byId 'pb3'
  target = fview.surface
  target.on "click", =>
    FView.byId('vpop3').modifier.setOpacity 0,{duration: 600,ease: "easeInOut"},=>
      FView.byId('pop3').surface.addClass 'hide'
      FView.byId('pb3').surface.addClass 'hide'
Template.pop4.rendered = ->
  fview = FView.byId 'pb4'
  target = fview.surface
  target.on "click", =>
    FView.byId('vpop4').modifier.setOpacity 0,{duration: 600,ease: "easeInOut"},=>
      FView.byId('pop4').surface.addClass 'hide'
      FView.byId('pb4').surface.addClass 'hide'
Template.pop5.rendered = ->
  fview = FView.byId 'pb5'
  target = fview.surface
  target.on "click", =>
    FView.byId('vpop5').modifier.setOpacity 0,{duration: 600,ease: "easeInOut"},=>
      FView.byId('pop5').surface.addClass 'hide'
      FView.byId('pb5').surface.addClass 'hide'
Template.pop6.rendered = ->
  fview = FView.byId 'pb6'
  target = fview.surface
  target.on "click", =>
    FView.byId('vpop6').modifier.setOpacity 0,{duration: 600,ease: "easeInOut"},=>
      FView.byId('pop6').surface.addClass 'hide'
      FView.byId('pb6').surface.addClass 'hide'

Template.pop7.rendered = ->
  fview = FView.byId 'pb7'
  target = fview.surface
  target.on "click", =>
    FView.byId('vpop7').modifier.setOpacity 0,{duration: 600,ease: "easeInOut"},=>
      FView.byId('pop7').surface.addClass 'hide'
      FView.byId('pb7').surface.addClass 'hide'
Template.pop8.rendered = ->
  fview = FView.byId 'pb8'
  target = fview.surface
  target.on "click", =>
    FView.byId('vpop8').modifier.setOpacity 0,{duration: 600,ease: "easeInOut"},=>
      FView.byId('pop8').surface.addClass 'hide'
      FView.byId('pb8').surface.addClass 'hide'
