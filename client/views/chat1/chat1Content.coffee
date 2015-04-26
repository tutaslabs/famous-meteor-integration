
Template.chat1Content.helpers
    'posting': ->
      query = Chat.find {}
      handle = query.observe
        added: (doc)->
            $('#pbody').scrollTop($('#pbody')[0].scrollHeight - $('#pbody')[0].clientHeight);
      return query

Template.chat1Content.events
      'click #ibtn':  (evt,tmpl) ->
        t = this._id
        Meteor.call 'removeChat',t


      'click #bbtn': (evt,tmpl) ->
#        Session.set 'currentTemplate','homeView'

        if App.hbtn is false
          Router.go('/')
          App.hbtn = true
        Meteor.setTimeout ->
          App.hbtn = false
        ,500



# ios bug.... button is getting dbl clicks even with fastclick fix
      'click  #ebtn' : (evt,tmpl) ->
        d = tmpl.find("#tfield").value

        Meteor.call 'newChat',{text: d}, (error,res) ->
            if error
              alert error.reason.reason
        $("#tfield").val("")



