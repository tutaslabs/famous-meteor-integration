Router.route 'rcMain',
    path: '/',
    template: 'homeView',

Router.route 'modifier'
Router.route 'modchain'
Router.route 'modblaze',->
  this.render 'modblaze',
    data: ->
      return {home: this.params.query.home}

Router.route 'draggable'
Router.route 'gridlayout'
Router.route 'flexiblelayout'
Router.route 'twoToggles', ->
  this.render 'twoToggles',
    data: ->
      return {home: this.params.query.home}




Router.route 'togglesw', ->
  this.render 'togglesw',
    data: ->
      return {home: this.params.query.home}

Router.route 'togit'
Router.route 'chat1View'
Router.route 'clickBox'
Router.route 'boxClickView'
Router.route 'boxDragView'
Router.route 'headfootView'
Router.route 'modheadfootView', ->
  App.ebtn = false
  this.render 'modheadfootView'
  Session.set 'currentModHeadFootTemplate','hfcontent2'

Router.route 'surface1', ->
  this.render 'surface1',
    data: ->
      return {home: this.params.query.home}
Router.route 'slider'

Router.route 'codeGridlayout'

