Template.twoToggles.rendered = ->

  App.events.on 'toggleOne',(data) =>
#    alert 'toggleOne '+data
#    alert 'state is '+v.view.state.get()

  App.events.on 'toggleTwo',(data) =>
#   alert 'toggleTwo '+data