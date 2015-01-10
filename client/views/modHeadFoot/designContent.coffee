Template.designContent.rendered = ->
  fview = FView.byId 'design'
  fvs = fview.surface

  h = $('.famous-container .famous-group')[0].scrollHeight

  fvs.setSize [undefined, h]