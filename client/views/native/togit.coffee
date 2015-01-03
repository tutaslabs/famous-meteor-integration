Template.togit.rendered = ->

  div = document.createElement('div')
  div.className += "test famous-container"
  document.body.appendChild(div);
  App.mainContext = Famous.Engine.createContext(div)
  App.mainContext.setPerspective 1000
  options =
    size: [150,75]
    origin: [.5,.5]
    align: [.5,.5]

  appViews = new App.Toggle options

  App.mainContext.add appViews