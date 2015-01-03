Template.slider.rendered = ->

  div = document.createElement('div')
  div.className += "test famous-container"
  document.body.appendChild(div);
  App.mainContext = Famous.Engine.createContext(div)
  App.mainContext.setPerspective 1000
  options =
    size: [150,25]
    origin: [.5,.5]
    align: [.7,.5]
    start: -60
    end: 60
    round: 0
    label: 'This is a test'
    initialVal: 30
    trackColor: 'lightgrey'
    sliderColor: 'lightblue'



  appViews = new App.Slider options

  App.mainContext.add appViews