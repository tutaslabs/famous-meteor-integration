Template.clickBox2.helpers
  'clickCount':  ->
    Session.get 'clickCount'
Template.clickBox2.events
  'click #b2': (evt,tmp) ->
      flag = Session.get 'clicked'
      if flag is off
        Session.set 'clicked',on
        fview = FView.from(tmp)
        App.animateAndIncrement fview
        Meteor.setTimeout =>
          Session.set 'clicked',off
        ,100