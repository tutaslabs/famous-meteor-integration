Template.circle.rendered = ->

  degtorad = 0.0174533
  fview = FView.from(this)

  fview.modifier.transformFrom =>
    scale = Math.cos App.angled.get()*degtorad
    return Famous.Transform.scale scale, scale, 1

