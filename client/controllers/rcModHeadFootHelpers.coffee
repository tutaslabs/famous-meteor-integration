Template.rcModHeadFoot.helpers
  'showTemplate': ->
    Template[this.name]
  'getTransition': ->
    Session.get 'currentTransitionHead'
Template.rcModHeadFoot.currentTemplate = ->
  Session.get 'currentModHeadFootTemplate'
