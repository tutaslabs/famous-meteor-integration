Router.route 'rcMain',
    path: '/',
    template: 'homeView',

Router.route 'modifier'
Router.route 'modchain'
Router.route 'modblaze'
Router.route 'draggable'
Router.route 'gridlayout'
Router.route 'flexiblelayout'
Router.route 'twoToggles'
Router.route 'togglesw'
Router.route 'togit'
Router.route 'chat1View'
Router.route 'clickBox'
Router.route 'boxClickView'
Router.route 'boxDragView'
Router.route 'headfootView'
Router.route 'modheadfootView'

Router.route 'surface1', ->
  this.render 'surface1',
    data: ->
      return {home: this.params.query.home}
Router.route 'slider'

Router.route 'codeGridlayout'