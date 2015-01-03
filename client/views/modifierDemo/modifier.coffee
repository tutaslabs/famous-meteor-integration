Template.modifier.rendered = ->

  div = document.createElement('div')
  div.className += "test famous-container"
  document.body.appendChild(div);
  App.mainContext = Famous.Engine.createContext(div)
  App.mainContext.setPerspective 1000

  appViews = new App.modifier
  App.mainContext.add appViews