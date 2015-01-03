Template.buttons.helpers

  'surfaces': [{val: "surface1",label: "Surfaces",desc: "Align and Origin",pop: "13",but: 'c'},
    {val: "gridlayout",label: "Grid Layout",desc: "Grid Layout View",pop: "11",but: 'c'},
    {val: "flexiblelayout",label: "Flexible Layout",desc: "Flexible Layout View",pop: "12",but: 'c'},
    {val: "togglesw",label: "Perspective",desc: "Setting viewport perspective",pop: "10",but: 'c'}


  ]
  'events': [{val: "clickBox",label: "ClickBox",desc: "Meteor vs Famo.us events",pop: "1",but: 'c'}]
  'transforms': [
    {val: "draggable",label: "Drag surface",desc: "Track w/Draggable",pop: "4",but: 'c'},
    {val: "boxClickView",label: "Physics/events",desc: "Mouse/touch w/physics",pop: "5",but: 'c'},
    {val: "modblaze",label: "Animation",desc: "Two surfaces in sync",pop: "6",but: 'c'},
    {val: "modchain",label: "Modifier Chain",desc: "Multiple modifiers on a node",pop: "13",but: 'c'}

  ]

  'database': [

    {val: "chat1View",label: "Chat",desc: "Bootstrap3 w/reactive DB",pop: "2",but: 'c'},
    {val: "headfootView",label: "Header Footer",desc: "Famo.us page/w react DB",pop: "3",but: 'c'}

  ]
  'advanced': [
    {val: "modheadfootView",label: "Fancy Panels",desc: "Taking it to the next level",pop: "7",but: 'c'},
    {val: "twoToggles",label: "Custom Views",desc: "Reusable Code",pop: "8",but: 'c'}

  ]
  'famous': [{val: "modifier",label: "Animate",desc:"Native",pop: "9",but: 'c'}]
  
Template.buttons.events
  'click #q': (event, tpl) ->
    FView.byId('pb'+event.target.value).surface.removeClass 'hide'
    FView.byId('pop'+event.target.value).surface.removeClass 'hide'
    FView.byId('vpop'+event.target.value).modifier.setOpacity .95


  'click #b': (event, tpl) ->
    Session.set 'currentHeadFootTemplate','hfcontent'
    Session.set 'currentTemplate', event.target.value

  'click #c': (event, tpl) ->
    Router.go '/'+event.target.value
