
Template.enterChat.events

# ios bug.... button is getting dbl clicks even with fastclick fix
  'click #ebtn': (evt,tmpl) ->
    d = tmpl.find("#tfield").value
    if App.ebtn is false
      Chat.insert
        text: d
      , (error,res) ->
          if error
            alert error
      $("#tfield").val("")
      App.ebtn = true
    Meteor.setTimeout ->
      App.ebtn = false
    ,500
