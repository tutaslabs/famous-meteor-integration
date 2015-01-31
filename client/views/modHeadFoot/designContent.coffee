Template.designContent.rendered = ->
  fview = FView.byId 'design'
  fvs = fview.surface
  sp =
    params:
      "token":'iamgood'
  url = Session.get('serverURL')+'/rest/design/'


  HTTP.call 'GET',url,sp,(error,result) =>
    if error
      alert 'Please check your internet connection'
    fvs.setContent JSON.parse(result.content).text

  h = $('.famous-group .famous-surface')[0].clientHeight

  fvs.setSize [undefined, 800]

