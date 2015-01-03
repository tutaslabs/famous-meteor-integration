Meteor.startup  ->
#generic simple scroll page of one surface
  class App.homeButton extends Famous.View
    DEFAULT_OPTIONS:
      label: 'WTF'
      size: [100,50]
      origin: [.5,.5]
      align: [.5,.5]
      font: 'x-large'

    constructor: (@options) ->
      for key, val of @DEFAULT_OPTIONS
        @options[key] = @options[key] ? val

      super @options
      @createPage()

    createPage: ->
      @flag= false
 #     Session.set 'clicked',false
      mod = new Famous.Modifier
        origin: @options.origin
        align: @options.align
        size: @options.size


      # create button surface

      but = new Famous.Surface
        size: [undefined,undefined]
        classes: ['btn','btn-primary']
        content: @options.label
        properties:
          textAlign: 'center'
          fontSize: @options.font
          zIndex: '70'

      but.on 'click',=>

#        flag = Session.get 'clicked'
        if  @flag is off
#          Session.set 'clicked',true
          @flag=true
          if @options.useRC and @options.useRC is 'Y'
            Session.set @options.RCtemplate,@options.RCview
          else
            Router.go '/'
          Meteor.setTimeout =>
#            Session.set 'clicked',false
            @flag=false
          ,500
     
      @add(mod).add but

