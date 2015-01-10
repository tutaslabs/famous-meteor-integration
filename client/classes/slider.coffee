Meteor.startup  ->
#a famous slider that will work on mobile
#public @value updates in realtime as tracking
#public @endValue will be the value then the slider stops

  class App.Slider extends Famous.View
    DEFAULT_OPTIONS:
      content: 'WTF'
      origin: [.5,.5]
      align: [.5,.5]

    constructor: (@options) ->
      super @options
      @createPage()

    createPage: ->

      intValue = @options.initialVal
      if intValue < @options.start
        intValue = @options.start
      if intValue > @options.end
        intValue = @options.end

      @pos = new Famous.Transitionable 0
      @value = @endValue = intValue
#max pos slider will return
      sliderRange = @options.size[0]-@options.size[1]
#calculate slider position for intvalue

      i1 = @options.end - intValue
      r =  @options.end - @options.start
      i3 = i1/r # percent from upper end
      i2 = sliderRange - Math.round(sliderRange*i3) #subtract upper percent from range to leave bottom pos

      v = new Famous.View

      modnode = new Famous.Modifier
        origin: @options.origin
        align: @options.align
        size: @options.size

      node = v.add modnode

      trackMod = new Famous.Modifier
        origin: [0,0]
        align: [0,0]
        size: [undefined,undefined]

      track = new Famous.Surface
          size: [undefined,undefined]
          properties:
              borderRadius: @options.size[1]+'px'
              border: '1px solid gray'
              backgroundColor: @options.trackColor
              textAlign: 'center'
              fontSize: Math.round( @options.size[1]/2)+'px'
          content: '<strong>'+@options.label+'</strong>'
      node.add(trackMod).add track

      ballMod = new Famous.Modifier
          origin: [0,0]
          align: [0,0]
          opacity: '.75'
          size: [@options.size[1],@options.size[1]]
      @drag = new Famous.Draggable
          xRange: [0,sliderRange]
          yRange: [0,0]
      @drag.setPosition [i2,0]



      @drag.on 'update' , (data) =>
        y = data.position[0]
        upper = @options.size[0]-@options.size[1]
        range = @options.end - @options.start

        if y is 0
          val = @options.start
        else if y is upper
          val = @options.end
        else
          val = @options.start+(y/upper * range)
          if @options.round > 0
            val = val.toFixed @options.round
          else val = Math.round val
        @ind.setContent val
        @value = val



      @drag.on 'end', (data) =>
        @endValue = @value
#        App.endValue = @value

      inx = - Math.round(@options.size[1]*.75)
      indMod = new Famous.Modifier
        origin:[.5,.5]
        align: [0.5,.5]
        transform: Famous.Transform.translate 0,inx,1

      @ind = new Famous.Surface
          properties:
            textAlign: 'center'
            fontSize: Math.round(@options.size[1]*.75)+'px'
      @ind.setContent intValue

      ball = new Famous.Surface
          properties:
            border: '1px solid gray'
            backgroundColor: @options.sliderColor
            borderRadius: @options.size[1]+'px'
          cursor: 'pointer'

      ball.pipe @drag
      node.add(ballMod).add(@drag).add ball
      node.add(indMod).add @ind

      sinx = Math.round(@options.size[1]*.75)
      stxtMod = new Famous.Modifier
        origin:[0,.5]
        align: [0,.5]
        size: [@options.size[0]/2,@options.size[1]/2]
        transform: Famous.Transform.translate 0,sinx,1

      @stxt = new Famous.Surface
        properties:
          textAlign: 'left'
          fontSize: Math.round(@options.size[1]*.5)+'px'
      @stxt.setContent @options.start


      etxtMod = new Famous.Modifier
        origin:[1,.5]
        align: [1,.5]
        size: [@options.size[0]/2,@options.size[1]/2]
        transform: Famous.Transform.translate 0,sinx,1

      @etxt = new Famous.Surface
        properties:
          textAlign: 'right'
          fontSize: Math.round(@options.size[1]*.5)+'px'
      @etxt.setContent @options.end

      node.add(etxtMod).add @etxt
      node.add(stxtMod).add @stxt

      @add node



