Template.modblaze.rendered = ->

  c = FView.byId 'mainCtx'
  c.context.setPerspective 1000
  fviewHome = FView.byId 'home'
  Session.set 'redboxclicked',false
  App.xpos.set 0
  App.scale.set 1

  fviewHome.surface.on "click", =>
    Session.set 'redboxclicked',false
    Router.go '/'






