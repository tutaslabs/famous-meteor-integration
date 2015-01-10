
Template.modscrollContent.rendered = ->
  fview = FView.from this
  fview.preventDestroy()


  t = new Famous.Transitionable 0

  fview.modifier.transformFrom =>
    currentPosition = t.get()
    return Famous.Transform.translate currentPosition,0, 0


  fview.onDestroy = ->
    fview = this
    t.set -800,{duration: 500, curve: 'easeOut'},->
      fview.destroy()

Template.modscrollContent.events
  'click #ibtn':  (evt,tmpl) ->
    t = this._id
    Meteor.call 'removeChat',t
