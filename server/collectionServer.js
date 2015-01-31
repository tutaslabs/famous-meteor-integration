if (Meteor.isServer) {

    Chat.allow({

        insert: function (userId, doc) {

            return true;
        },
        update: function (userId, doc, fields, modifier) {
            return false;
        },
        remove: function (userId, doc) {
            return true;
        }


    })
}