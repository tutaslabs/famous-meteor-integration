Template.togglesw.rendered = ->
#ios probs on click

  cs = FView.byId 'mainCtx'
  cs.context.setPerspective 1000


  sl = FView.byId 'slider'
  slv = sl.view



  br = FView.byId 'br'

  brm = br.modifier
  brm.transformFrom =>
    dtor = 0.0174533
    return Famous.Transform.rotateY slv.value * dtor





