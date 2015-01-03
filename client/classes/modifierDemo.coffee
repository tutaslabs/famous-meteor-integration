Meteor.startup  ->
##########  iOS notes   ###########
# had to drop the precision of the radians used in the rotate transform. the default JS significant digits was
# way to great causing the transform calcs to not work
# had to translate the circle in the z axis to 90 to clear the rotated box and not clip.
# definately a safari bug.  chrome and firefox behaved as expected and didn't clip the circle


#generic simple scroll page of one surface
  class App.modifier extends Famous.View
    DEFAULT_OPTIONS:
      content: undefined
    constructor: (@options) ->
      super @options
      @createPage()



    createPage: ->

# state variables
      Session.set 'redboxclicked',false
      defaultd = -60
      degtorad = 0.0174533
      size = [300, 400]
      App.angled = new Famous.Transitionable defaultd
      @isToggled = false

      header = new Famous.Surface
          size: [undefined,75]
          content: 'Famo.us University Modifier Example'
          properties:
              textAlign: 'center'
              fontSize: 'large'

# create red card surface
      @surface = new Famous.Surface
          size: size
          content: 'Click Me'
          properties:
              fontSize: '26px'
              paddingTop: '40px'
              color: 'white'
              textAlign: 'center'
              backgroundColor: '#FA5C4F'
              cursor: 'pointer'
              border: 'solid 2px black'
              borderRadius: '20px'
# rotates red card surface and circle
      rotationModifier = new Famous.Modifier
          size: size,
          origin: [0.5, 0.5]
          align: [0.5, 0.5]
#          transform: ->
#              return Famous.Transform.rotateY App.angle.get()


      @add(rotationModifier).add @surface

      rotationModifier.transformFrom =>
          return Famous.Transform.rotateY App.angled.get()*degtorad

      circle = new Famous.Surface
          size : [200, 200]
          properties :
              backgroundColor: 'white'
              borderRadius: '100px'
              pointerEvents : 'none'
              textAlign: 'center'
              paddingTop: '50px'
              fontSize: 'x-large'
              border: 'solid 2px green'

      circle.setContent Blaze.toHTML(Template.imacircle)


#scales circle based on angle of rotation
      circleScaleModifier = new Famous.Modifier
          origin: [0.5, 0.5]
          align: [0.5, 0.5]
          transform: ->
              scale = Math.cos App.angled.get()*degtorad
              return Famous.Transform.scale scale, scale, 90

#positions circle above red card surface
      circleLayerModifier = new Famous.Modifier
          transform: Famous.Transform.translate 0, 0, 1


      @add(circleScaleModifier).add(circleLayerModifier).add circle


      b2 = new Famous.Surface
        size: [80, 40]
        content: 'Home'
        classes: ['btn','btn-primary']
        properties:
          textAlign: 'center'
          fontSize: 'large'
      b2.on 'click', =>
          $('.test').remove()
          Router.go '/'

      @add(new Famous.Modifier({align: [0.5,.96],origin: [0.5,.5]})).add b2
      @add(new Famous.Modifier({origin: [0,0]})).add header

      @surface.on 'click', =>
        flag = Session.get 'redboxclicked'
        if  flag is off


            Session.set 'redboxclicked',true
            if App.isToggled is on
              targetAngle = defaultd
            else
              targetAngle = -defaultd
            if (App.angled.isActive())
              App.angled.halt()

            App.angled.set targetAngle, { duration: 2000, curve: 'easeInOut' }
            App.isToggled = !App.isToggled

            Meteor.setTimeout ->
              Session.set 'redboxclicked',false
            ,500