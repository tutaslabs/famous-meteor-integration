var Schemas = {};

Schemas.Chat = new SimpleSchema({
    text: {
        type: String,
        label: "text",
        max: 25,
        optional: false},
    createdAt: {
        type: Date,
        label: "Create Date",
        denyUpdate: true,
        optional: false,
        autoValue: function () {
            if (this.isInsert)
                return new Date;
            else if (this.isUpsert)
                return {$setOnInsert: new Date};
            else
                this.unset();
        }}
});


Chat.attachSchema(Schemas.Chat);