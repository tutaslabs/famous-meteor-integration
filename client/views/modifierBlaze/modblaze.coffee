Template.modblaze.rendered = ->

  c = FView.byId 'mainCtx'
  c.context.setPerspective 1000
  fviewHome = FView.byId 'home'
  hts = FView.byId('ht').surface


  #home query value passed by iron router
  home = this.data.home

  #this does not 'hide' the button - only makes it invisible
  if home is 'no'
    fviewHome.modifier.setOpacity(0)
    hts.setContent ' '

  Session.set 'redboxclicked',false
  App.xpos.set 0
  App.scale.set 1

  fviewHome.surface.on App.EVENT_TYPE, =>
    Session.set 'redboxclicked',false
    Router.go '/'






