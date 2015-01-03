Meteor.startup  ->
  FView.registerModifier 'Draggable',famous.modifiers.Draggable
  FView.registerModifier 'ModifierChain',famous.modifiers.ModifierChain
  FView.registerView 'GridLayout', famous.views.GridLayout
  FView.registerView 'FlexibleLayout', famous.views.FlexibleLayout


  FView.registerView 'Toggle',null,
    create: (options) ->
      return new App.Toggle options
    add: (child_fview, child_options) ->
      throw new Error("Cannot add View to Toggle")
    attrUpdate: (key, value, oldValue, data, firstTime) ->

  FView.registerView 'homeButton',null,
    create: (options) ->
      return new App.homeButton options
    add: (child_fview, child_options) ->
      throw new Error("Cannot add to homeButton")

  FView.registerView 'Slider',null,
    create: (options) ->
      return new App.Slider options
    add: (child_fview, child_options) ->
      throw new Error("Cannot add to slider")


