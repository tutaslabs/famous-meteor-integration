Template.chat1View.rendered = ->
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
    console.log 'trans'
    fview.modifier.setTransform trf,trtf



