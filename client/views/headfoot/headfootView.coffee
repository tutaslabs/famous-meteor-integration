Template.footButtonHome.events
  'click #but' : (evt,tmp) ->
      Router.go '/'

Template.footButtonPage2.events
  'click #but2' : (evt,tmp) ->
      Session.set 'currentHeadFootTemplate','scrollView'
      FView.byId('head-text').surface.setContent 'Chat List'

Template.footButtonPage1.events
  'click #but1' : (evt,tmp) ->
    Session.set 'currentHeadFootTemplate','hfcontent'
    FView.byId('head-text').surface.setContent 'Page 1'

Template.headfootView.rendered = ->
  Meteor.subscribe 'chat'
#pull the view up then animate down when finished
#happens so fast appears to be animating down only
  trt =
    duration: 1,
    curve: famous.transitions.Easing.easeOut
  tr = famous.core.Transform.rotateX Math.PI/2

  trtf =
    duration: 500,
    curve: famous.transitions.Easing.easeOut
  trf = famous.core.Transform.rotateX 0

  fview = FView.byId('v1')

  fview.modifier.setTransform tr,trt,=>
    fview.modifier.setTransform trf,trtf

