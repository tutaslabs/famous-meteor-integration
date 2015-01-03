Template.box.rendered = ->



  springt =
    method: "spring",
    period: 100,
    dampingRatio: .1,
    velocity: 0.005
  trt =
    duration: 500,
    curve: famous.transitions.Easing.inOutQuad

  fview = FView.from(this)
  target = fview.surface
#we have to do it this way cause the way famous-views is triggering render
  if "box2" in target.classList
    target.content.textContent = 'Mouseover'
  else
    target.content.textContent = 'click moves right'


  target.on 'click', ->
    t = this
    if t._matrix[12] > (window.innerWidth / 2) - 10
      tr = famous.core.Transform.translate(0,0,0)
      t.setContent 'click moves right'
    else
      tr = famous.core.Transform.translate(100,0,0)
      t.setContent 'click move left'
 #   fview.modifier.setTransform tr,{ duration: 500,curve: famous.transitions.Easing.inOutQuad }
    fview.modifier.setTransform tr,springt

  target.on 'mouseover', ->
    if "box2" in this.classList
      if this._matrix[12] > (window.innerWidth / 2) - 10
        tr = famous.core.Transform.translate(0,0,0)
      else
        tr = famous.core.Transform.translate(100,0,0)
      fview.modifier.setTransform tr,trt