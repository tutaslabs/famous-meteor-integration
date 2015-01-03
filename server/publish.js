Meteor.publish('chat',function() {
    return Chat.find();
});

