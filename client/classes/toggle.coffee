Meteor.startup  ->
#generic simple scroll page of one surface
  class App.Toggle extends Famous.View
    DEFAULT_OPTIONS:
      content: 'WTF'
      origin: [.5,.5]
      align: [.5,.5]

    constructor: (@options) ->
      super @options
      @createPage()

    createPage: ->

      if !@options.event
        @event = 'toggle'
      else
        @event = @options.event

      @state = new Famous.Transitionable 0
      @isToggled = false
      TRANSITION = { duration: 700, curve: Famous.Easing.outBounce }

      v = new Famous.View

      modnode = new Famous.Modifier
        origin: @options.origin
        align: @options.align
        size: @options.size

      node = v.add modnode

# create green surface

      grnmod = new Famous.Modifier
        origin: [0,0]
        align: [0,0]
        size: [undefined,undefined]
        opacity: =>
          return @state.get()

      redmod = new Famous.Modifier
        origin: [0,0]
        align: [0,0]
        size: [undefined,undefined]
        opacity: =>
          return 1 - @state.get()

      grn = new Famous.Surface
          size: [undefined,undefined]
          properties:
              borderRadius: @options.size[1]+'px'
              border: '1px solid gray'
              backgroundColor: 'limegreen'

      red = new Famous.Surface
          size: [undefined,undefined]
          properties:
              borderRadius: @options.size[1]+'px'
              border: '1px solid gray'
              backgroundColor: 'red'

      node.add(redmod).add red
      node.add(grnmod).add grn

      tmod = new Famous.Modifier
          origin: [0,0]
          align: [0,0]
          size: [@options.size[1],@options.size[1]]
          transform: =>
            xPos = @state.get() * (@options.size[0]-@options.size[1])
#            xPos = Math.round(xPos)
            return Famous.Transform.translate(xPos, 0, 5)


      toggle = new Famous.Surface
        properties:
          border: '1px solid gray'
          backgroundColor: 'white'
          borderRadius: @options.size[1]+'px'
          textAlign: 'center'
          cursor: 'pointer'
        content: 'OFF'

      node.add(tmod).add toggle
      @add node

      toggle.on 'click',=>
        flag = Session.get 'clicked'
        if  flag is off
          Session.set 'clicked',true
# Halts current animation if active
          if @state.isActive()
            @state.halt()
    #Sets end transition state
          if @isToggled
            @state.set 0,TRANSITION
            App.events.emit @event,'off'
            toggle.setContent 'OFF'
            if @options.session
              Session.set @options.session,0
          else
            @state.set 1,TRANSITION
            toggle.setContent 'ON'
            App.events.emit @event,'on'
            if @options.session
              Session.set @options.session,1
          @isToggled = ! @isToggled

          Meteor.setTimeout ->
            Session.set 'clicked',false
          ,500

