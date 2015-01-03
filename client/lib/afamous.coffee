Meteor.startup ->
  Famous.Engine = famous.core.Engine
  Famous.View = famous.core.View
  Famous.Surface = famous.core.Surface
  Famous.Modifier = famous.core.Modifier
  Famous.Transform = famous.core.Transform
  Famous.Draggable = famous.modifiers.Draggable
  Famous.StateModifier = famous.modifiers.StateModifier
  Famous.ModifierChain = famous.modifiers.ModifierChain
  Famous.RenderController = famous.views.RenderController
  Famous.EventHandler = famous.core.EventHandler

  Famous.Scrollview = famous.views.Scrollview
  Famous.HeaderFooterLayout = famous.views.HeaderFooterLayout

  Famous.Easing = famous.transitions.Easing
  Famous.Transitionable = famous.transitions.Transitionable

  Famous.GenericSync     = famous.inputs.GenericSync
  Famous.MouseSync = famous.inputs.MouseSync
  Famous.TouchSync = famous.inputs.TouchSync


  Famous.Timer           = famous.utilities.Timer

  #Famous.FastClick       = famous.inputs.FastClick
  Famous.Transitionable.registerMethod 'spring',famous.transitions.SpringTransition

  Famous.GenericSync.register
    mouse: Famous.MouseSync
    touch: Famous.TouchSync