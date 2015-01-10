Template.twoToggles.rendered = ->

  v = FView.byId 'xx'

  #home query value passed by iron router
  home = this.data.home
  hbm = FView.byId('hb').modifier
  #this does not 'hide' the button - only makes it invisible
  if home is 'no'
    hbm.setOpacity(0)

  App.events.on 'toggleOne',(data) =>
#reading state directly from view transitional
#    alert 'state is '+ !v.view.state.get()

  App.events.on 'toggleTwo',(data) =>
#   alert 'toggleTwo '+data