Template.togglesw.rendered = ->
#ios probs on click

  cs = FView.byId 'mainCtx'
  cs.context.setPerspective 1000

  slv = FView.byId('slider').view

  brm = FView.byId('br').modifier

  brm.transformFrom =>
    dtor = 0.0174533
    return Famous.Transform.rotateY slv.value * dtor

  #home query value passed by iron router
  home = this.data.home
  hts = FView.byId('ht').surface

  hbm = FView.byId('hb').modifier
  #this does not 'hide' the button - only makes it invisible
  if home is 'no'
    hbm.setOpacity(0)
    hts.setContent ' '



