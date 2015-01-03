Template.modchain.rendered = ->
#will not work on mobile - doesn't get the click's on s
  fview = FView.byId 's1'

  App.moved = false
  clicked = off
  modifierChain = new Famous.ModifierChain

  modifierOne = new Famous.Modifier
    origin: [0.5, 0.5]
    align: [.5,.5]
  modifierTwo = new Famous.Modifier
    transform: Famous.Transform.translate(0, 50, 0)

  modifierChain.addModifier(modifierOne)
  modifierChain.addModifier(modifierTwo)

  s = new Famous.Surface
    size: [200, 200]
    content: "Click me to remove the center origin modifier"
    classes: ["bg-red"],
    properties:
      textAlign: "center"
      fontSize: 'x-large'

  fview.parent.node.add(modifierChain).add s

  s.on 'click', =>
    if clicked is off
      clicked = on
      if App.moved is off
        modifierChain.removeModifier(modifierOne)
        s.setContent 'Success! Click to add back.'
        App.moved = true
      else
        modifierChain.addModifier(modifierOne)
        s.setContent 'Click me to remove the center origin modifier'
        App.moved = false
      Meteor.setTimeout =>
        clicked = false
      ,100

  fviewb = FView.byId 'b1'
  b = fviewb.surface
  b.on 'click',=>
    Router.go '/'
