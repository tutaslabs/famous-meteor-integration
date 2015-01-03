Template.draggable.rendered = ->

  fview = FView.byId 's1'
  drag = fview.modifier
  s = fview.surface
  s.pipe fview.modifier
  drag.setOptions {xRange: [-500,500],yRange: [-400,400]}
  drag.on 'end', =>
    drag.setPosition [0,0],{curve : 'easeOutBounce', duration : 300}

