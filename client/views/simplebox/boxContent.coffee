
Template.boxContent.events
  'click #but1' : (evt,tmp) ->
    fview = FView.from tmp
#to force the url to update when using 'routing' note that setting session is enough to force page load
    Router.go '/'

