Template.surface1.rendered = ->

#home query value passed by iron router
  home = this.data.home
  hbm = FView.byId('hb').modifier
#this does not 'hide' the button - only makes it invisible
  if home is 'no'
    hbm.setOpacity(0)

  sview = FView.byId('slide').view
  yview = FView.byId('slideY').view

  saview = FView.byId('slideA').view
  yaview = FView.byId('slideAY').view

  redMod   = FView.byId('red').modifier
  sred = FView.byId('red').surface


  redMod.alignFrom =>
    sred.setContent ' Align '+sview.value+','+yview.value+'<br>Origin '+saview.value+','+yaview.value+'<br><br>Surface'
    return [sview.value,yview.value]
  redMod.originFrom =>
    return [saview.value,yaview.value]

