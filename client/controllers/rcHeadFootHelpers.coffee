Template.rcHeadFoot.helpers
  'showTemplate': ->
    Template[this.name]
  'getTransition': ->
    Session.get 'currentTransitionHead'
Template.rcHeadFoot.currentTemplate = ->
  Session.get 'currentHeadFootTemplate'
