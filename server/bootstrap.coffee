Meteor.startup  ->

  if Chat.find().count() is 0
    for x in [0..10]
      Chat.insert text: 'This is line '+x


Meteor.methods
  newChat:  (post) ->
    Chat.insert post,
    (error,res) =>
      if error
        throw new Meteor.Error(404, error)
        return error
      else
        return ''
  removeChat: (id) ->
    Chat.remove _id: id,
      (error,res) =>
        if error
          throw new Meteor.Error(404, error)
          return error
        else
          return ''