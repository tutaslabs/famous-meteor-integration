Template.dribbleContent.rendered = ->


  fview = FView.byId 'dribble'
  fvs = fview.surface

  h = $('.famous-container .famous-group')[0].scrollHeight

  fvs.setSize [undefined, h]


