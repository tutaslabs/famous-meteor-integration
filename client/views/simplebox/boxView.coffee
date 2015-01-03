Template.boxView.rendered = ->
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

  fview = FView.from(this)

  fview.modifier.setTransform tr,trt,=>
    fview.modifier.setTransform trf,trtf

